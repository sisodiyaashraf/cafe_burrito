#!/usr/bin/env python3
"""Asset processing and validation tool for Cafe Burrito.

Processes raw art assets: removes background, trims transparency,
pads with margin, center-crops aspect ratios, and resizes.
Also includes a check mode to validate asset dimensions and transparency.
"""

from __future__ import annotations

import argparse
import os
import sys
from pathlib import Path
from typing import NamedTuple, Sequence

from PIL import Image

SUPPORTED_EXTENSIONS = {".png", ".jpg", ".jpeg", ".webp"}

FOLDER_CONSTRAINTS = {
    "items": {"size": (128, 128), "require_transparency": True},
    "ui": {"size": (96, 96), "require_transparency": True},
    "characters": {"size": (256, 256), "require_transparency": True},
    "rooms": {"size": (1080, 420), "require_transparency": False},
}


class CheckResult(NamedTuple):
    file_path: Path
    dimensions: tuple[int, int]
    size_kb: float
    flags: list[str]


def sanitize_filename(filename: str) -> str:
    """Lowercase and replace spaces with underscores, ensuring .png extension."""
    stem = Path(filename).stem.lower().replace(" ", "_")
    return f"{stem}.png"


def trim_transparent(image: Image.Image) -> Image.Image:
    """Trim fully transparent borders from an RGBA image."""
    if image.mode != "RGBA":
        image = image.convert("RGBA")
    bbox = image.getbbox()
    if bbox is None:
        return image
    return image.crop(bbox)


def pad_and_resize(
    image: Image.Image,
    target_size: int,
    margin: float = 0.08,
) -> Image.Image:
    """Trim, pad to a square canvas with margin, and resize to target_size."""
    if image.mode != "RGBA":
        image = image.convert("RGBA")

    trimmed = trim_transparent(image)
    orig_w, orig_h = trimmed.size

    if orig_w == 0 or orig_h == 0:
        return Image.new("RGBA", (target_size, target_size), (0, 0, 0, 0))

    available_size = target_size * (1.0 - 2.0 * margin)
    scale = available_size / max(orig_w, orig_h)
    new_w = max(1, round(orig_w * scale))
    new_h = max(1, round(orig_h * scale))

    resized = trimmed.resize((new_w, new_h), Image.Resampling.LANCZOS)

    canvas = Image.new("RGBA", (target_size, target_size), (0, 0, 0, 0))
    offset_x = (target_size - new_w) // 2
    offset_y = (target_size - new_h) // 2
    canvas.paste(resized, (offset_x, offset_y), resized)
    return canvas


def crop_and_resize(
    image: Image.Image,
    target_w: int,
    target_h: int,
) -> Image.Image:
    """Center-crop image to target aspect ratio and resize to target_w x target_h."""
    if image.mode != "RGBA":
        image = image.convert("RGBA")

    orig_w, orig_h = image.size
    target_ratio = target_w / target_h
    orig_ratio = orig_w / orig_h

    if orig_ratio > target_ratio:
        crop_w = round(orig_h * target_ratio)
        offset_x = (orig_w - crop_w) // 2
        crop_box = (offset_x, 0, offset_x + crop_w, orig_h)
    else:
        crop_h = round(orig_w / target_ratio)
        offset_y = (orig_h - crop_h) // 2
        crop_box = (0, offset_y, orig_w, offset_y + crop_h)

    cropped = image.crop(crop_box)
    return cropped.resize((target_w, target_h), Image.Resampling.LANCZOS)


def remove_background(image: Image.Image) -> Image.Image:
    """Remove background using rembg."""
    try:
        from rembg import remove
    except ImportError as e:
        raise RuntimeError(
            "rembg is not installed. Install it via 'pip install rembg[cpu]' "
            "or use the --no-rembg flag."
        ) from e
    return remove(image)


def process_single_file(
    input_file: Path,
    output_dir: Path,
    size: int | None = None,
    aspect: tuple[int, int] | None = None,
    margin: float = 0.08,
    use_rembg: bool = False,
    overwrite: bool = False,
) -> tuple[str, str, str, str]:
    """Process a single image file. Returns (file_name, orig_size, final_size, status)."""
    out_name = sanitize_filename(input_file.name)
    out_path = output_dir / out_name

    if out_path.exists() and not overwrite:
        return (out_name, "-", "-", "skipped (exists)")

    try:
        with Image.open(input_file) as img:
            img = img.convert("RGBA")
            orig_size_str = f"{img.width}x{img.height}"

            if use_rembg:
                img = remove_background(img)

            if aspect is not None:
                final_img = crop_and_resize(img, aspect[0], aspect[1])
            elif size is not None:
                final_img = pad_and_resize(img, size, margin)
            else:
                return (out_name, orig_size_str, "-", "error: size or aspect required")

            output_dir.mkdir(parents=True, exist_ok=True)
            final_img.save(out_path, format="PNG", optimize=True)
            final_size_str = f"{final_img.width}x{final_img.height}"
            return (out_name, orig_size_str, final_size_str, "processed")
    except Exception as exc:
        return (out_name, "-", "-", f"error: {exc}")


def check_assets(target_dir: Path) -> list[CheckResult]:
    """Validate all PNGs in target_dir against project constraints."""
    results: list[CheckResult] = []

    for path in sorted(target_dir.rglob("*.png")):
        flags: list[str] = []
        try:
            size_kb = path.stat().st_size / 1024.0
            if size_kb > 300.0:
                flags.append(f"file size > 300 KB ({size_kb:.1f} KB)")

            with Image.open(path) as img:
                dims = (img.width, img.height)
                folder_name = path.parent.name.lower()

                if folder_name in FOLDER_CONSTRAINTS:
                    constraint = FOLDER_CONSTRAINTS[folder_name]
                    expected_size = constraint["size"]
                    if dims != expected_size:
                        flags.append(
                            f"wrong size (got {dims[0]}x{dims[1]}, expected {expected_size[0]}x{expected_size[1]})"
                        )

                    if constraint["require_transparency"]:
                        if img.mode != "RGBA":
                            flags.append(f"missing transparency (mode is {img.mode})")
                        else:
                            extrema = img.getextrema()
                            if len(extrema) >= 4 and extrema[3][0] == 255:
                                flags.append("missing transparency (all pixels opaque)")
        except Exception as exc:
            dims = (0, 0)
            size_kb = 0.0
            flags.append(f"cannot read: {exc}")

        results.append(
            CheckResult(
                file_path=path,
                dimensions=dims,
                size_kb=size_kb,
                flags=flags,
            )
        )

    return results


def run_check_mode(target_dir: Path) -> int:
    """Print check results and return non-zero exit code if issues found."""
    if not target_dir.exists():
        print(f"Error: Directory not found: {target_dir}")
        return 1

    results = check_assets(target_dir)
    if not results:
        print(f"No PNG files found in {target_dir}.")
        return 0

    print("=" * 80)
    print(f"{'File':<40} {'Dimensions':<12} {'Size':<10} {'Status / Flags'}")
    print("-" * 80)

    issue_count = 0
    for res in results:
        rel_path = str(res.file_path).replace("\\", "/")
        if len(rel_path) > 38:
            rel_path = "..." + rel_path[-35:]
        dim_str = f"{res.dimensions[0]}x{res.dimensions[1]}"
        size_str = f"{res.size_kb:.1f} KB"

        if res.flags:
            status_str = "FLAGGED: " + "; ".join(res.flags)
            issue_count += 1
        else:
            status_str = "OK"

        print(f"{rel_path:<40} {dim_str:<12} {size_str:<10} {status_str}")

    print("=" * 80)
    print(f"Total files checked: {len(results)} | Issues found: {issue_count}")
    return 1 if issue_count > 0 else 0


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Process and validate Cafe Burrito art assets."
    )
    parser.add_argument(
        "--check",
        type=Path,
        metavar="DIR",
        help="Check PNG dimensions, transparency, and sizes in DIR.",
    )
    parser.add_argument(
        "--input",
        type=Path,
        metavar="DIR",
        help="Directory containing raw images to process.",
    )
    parser.add_argument(
        "--output",
        type=Path,
        metavar="DIR",
        help="Directory where processed PNGs will be saved.",
    )
    parser.add_argument(
        "--size",
        type=int,
        help="Target square dimension in pixels (e.g. 128, 256, 96).",
    )
    parser.add_argument(
        "--aspect",
        type=str,
        help="Target aspect ratio as WxH (e.g. 1080x420).",
    )
    parser.add_argument(
        "--margin",
        type=float,
        default=0.08,
        help="Transparent margin fraction on square canvas (default: 0.08).",
    )
    parser.add_argument(
        "--no-rembg",
        action="store_true",
        help="Do not remove background with rembg.",
    )
    parser.add_argument(
        "--rembg",
        action="store_true",
        help="Force background removal with rembg (e.g. with --aspect).",
    )
    parser.add_argument(
        "--overwrite",
        action="store_true",
        help="Overwrite existing output files.",
    )

    args = parser.parse_args(argv)

    if args.check:
        return run_check_mode(args.check)

    if not args.input or not args.output:
        parser.error("--input and --output are required unless --check is specified.")

    if not args.input.exists():
        print(f"Error: Input directory not found: {args.input}", file=sys.stderr)
        return 1

    parsed_aspect: tuple[int, int] | None = None
    if args.aspect:
        try:
            parts = args.aspect.lower().split("x")
            if len(parts) != 2:
                raise ValueError
            parsed_aspect = (int(parts[0]), int(parts[1]))
        except ValueError:
            print(
                f"Error: Invalid --aspect format '{args.aspect}'. Expected WxH (e.g. 1080x420).",
                file=sys.stderr,
            )
            return 1

    if args.size is None and parsed_aspect is None:
        print(
            "Error: Either --size (e.g. 128) or --aspect (e.g. 1080x420) must be specified.",
            file=sys.stderr,
        )
        return 1

    use_rembg = args.rembg if parsed_aspect else (not args.no_rembg)

    files = [
        p
        for p in sorted(args.input.iterdir())
        if p.is_file() and p.suffix.lower() in SUPPORTED_EXTENSIONS
    ]

    if not files:
        print(f"No supported images ({', '.join(SUPPORTED_EXTENSIONS)}) found in {args.input}.")
        return 0

    print("=" * 80)
    print(f"{'File':<30} {'Original':<15} {'Final':<15} {'Status'}")
    print("-" * 80)

    for file_path in files:
        name, orig_sz, final_sz, status = process_single_file(
            input_file=file_path,
            output_dir=args.output,
            size=args.size,
            aspect=parsed_aspect,
            margin=args.margin,
            use_rembg=use_rembg,
            overwrite=args.overwrite,
        )
        print(f"{name:<30} {orig_sz:<15} {final_sz:<15} {status}")

    print("=" * 80)
    print("Done processing assets.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
