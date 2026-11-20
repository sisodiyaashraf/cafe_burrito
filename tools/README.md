# Cafe Burrito Asset Processing Tool

A command-line script to batch process raw concept/AI-generated art into game-ready PNG assets for Cafe Burrito.

## Requirements & Installation

Python 3.10+ is required. Install dependencies from `tools/requirements.txt`:

```bash
pip install -r tools/requirements.txt
```

Dependencies:
- `Pillow`: Image resizing, cropping, padding, and optimization.
- `rembg[cpu]`: Background removal using the ONNX CPU runtime.
- `pytest`: Unit testing for asset math.

## Usage

### Command Line Options

```bash
python tools/process_assets.py [OPTIONS]
```

- `--input DIR`: Directory containing raw input images (`.png`, `.jpg`, `.jpeg`, `.webp`).
- `--output DIR`: Directory where processed PNGs will be saved.
- `--size N`: Target square dimensions (e.g. `128` for items, `256` for characters, `96` for UI).
- `--aspect WxH`: Target aspect ratio crop and resize (e.g. `1080x420` for room backgrounds). When specified, background removal is disabled by default.
- `--margin F`: Transparent margin fraction on each side of square canvas (default: `0.08`).
- `--no-rembg`: Skip background removal.
- `--rembg`: Force background removal (e.g., when used alongside `--aspect`).
- `--overwrite`: Overwrite existing files in the output directory.
- `--check DIR`: Scan directory and validate PNG dimensions, transparency, and file size limits.

---

## Examples

### 1. Process Menu Item Icons (128x128 with background removal)
Processes raw item drawings, strips the background, trims transparency, adds an 8% margin, and resizes to 128x128:
```bash
python tools/process_assets.py --input art_raw/items --output assets/images/items --size 128
```

### 2. Process Characters (256x256 with custom margin)
Removes background, trims transparent borders, and centers characters on a 256x256 square canvas:
```bash
python tools/process_assets.py --input art_raw/characters --output assets/images/characters --size 256 --margin 0.05
```

### 3. Process Room Backgrounds (1080x420 without background removal)
Center-crops wide room concepts to 1080x420 aspect ratio and resizes to exact dimensions:
```bash
python tools/process_assets.py --input art_raw/rooms --output assets/images/rooms --aspect 1080x420
```

### 4. Check & Validate Assets
Validates all assets against folder dimension specifications, checks for proper transparency, and warns on files > 300 KB:
```bash
python tools/process_assets.py --check assets/images
```

---

## Running Unit Tests

Run the pytest suite to verify crop, resize, and padding calculations:

```bash
pytest tools/test_process_assets.py
```
