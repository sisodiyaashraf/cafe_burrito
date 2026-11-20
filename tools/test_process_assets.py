from __future__ import annotations

import tempfile
from pathlib import Path
from PIL import Image

from tools.process_assets import (
    check_assets,
    crop_and_resize,
    pad_and_resize,
    sanitize_filename,
    trim_transparent,
)


def test_sanitize_filename() -> None:
    assert sanitize_filename("Espresso Cup 01.JPG") == "espresso_cup_01.png"
    assert sanitize_filename("Room Pizza Oven.WEBP") == "room_pizza_oven.png"
    assert sanitize_filename("Item-Latte.PNG") == "item-latte.png"


def test_trim_transparent() -> None:
    # 100x100 transparent image with 40x20 opaque box from (30, 40) to (70, 60)
    img = Image.new("RGBA", (100, 100), (0, 0, 0, 0))
    for x in range(30, 70):
        for y in range(40, 60):
            img.putpixel((x, y), (255, 0, 0, 255))

    trimmed = trim_transparent(img)
    assert trimmed.size == (40, 20)


def test_pad_and_resize_square() -> None:
    # 50x100 transparent image with 20x40 opaque box in center
    img = Image.new("RGBA", (50, 100), (0, 0, 0, 0))
    for x in range(15, 35):
        for y in range(30, 70):
            img.putpixel((x, y), (0, 255, 0, 255))

    target_size = 128
    margin = 0.08
    processed = pad_and_resize(img, target_size=target_size, margin=margin)

    assert processed.size == (target_size, target_size)
    assert processed.mode == "RGBA"

    # Verify borders are transparent
    assert processed.getpixel((0, 0))[3] == 0
    assert processed.getpixel((127, 0))[3] == 0
    assert processed.getpixel((0, 127))[3] == 0
    assert processed.getpixel((127, 127))[3] == 0

    # Verify center pixel is opaque
    center_alpha = processed.getpixel((64, 64))[3]
    assert center_alpha > 0


def test_crop_and_resize_aspect_wide() -> None:
    # Input is wider than target aspect (1200x400 = 3.0 ratio vs 1080/420 ~ 2.57)
    img = Image.new("RGBA", (1200, 400), (255, 128, 0, 255))
    res = crop_and_resize(img, target_w=1080, target_h=420)
    assert res.size == (1080, 420)


def test_crop_and_resize_aspect_tall() -> None:
    # Input is taller than target aspect (800x800 = 1.0 ratio vs 1080/420 ~ 2.57)
    img = Image.new("RGBA", (800, 800), (100, 200, 50, 255))
    res = crop_and_resize(img, target_w=1080, target_h=420)
    assert res.size == (1080, 420)


def test_check_assets() -> None:
    with tempfile.TemporaryDirectory() as tmp_dir:
        root = Path(tmp_dir)
        items_dir = root / "items"
        items_dir.mkdir()

        # Valid item: 128x128 with transparency
        valid_img = Image.new("RGBA", (128, 128), (0, 0, 0, 0))
        valid_img.putpixel((64, 64), (255, 255, 255, 255))
        valid_path = items_dir / "valid_item.png"
        valid_img.save(valid_path)

        # Invalid item: 100x100 fully opaque (RGB)
        invalid_img = Image.new("RGB", (100, 100), (255, 0, 0))
        invalid_path = items_dir / "invalid_item.png"
        invalid_img.save(invalid_path)

        results = check_assets(root)
        assert len(results) == 2

        valid_res = next(r for r in results if r.file_path == valid_path)
        invalid_res = next(r for r in results if r.file_path == invalid_path)

        assert valid_res.flags == []
        assert any("wrong size" in f for f in invalid_res.flags)
        assert any("missing transparency" in f for f in invalid_res.flags)
