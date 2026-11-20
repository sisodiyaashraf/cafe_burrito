# Progress
- [x] Step 0: Documentation
- [x] Step 1: Project setup
- [x] Step 2: App shell, bottom navigation, HUD
- [x] Step 3: Domain models and menu data
(Update this checklist after every step. Add notes about decisions and known issues below.)

## Notes
### Step 3.6 Decisions & Details
- Created asset processing toolchain in `tools/process_assets.py` with Pillow and optional rembg integration.
- Supports background removal, transparent padding/margin, center-crop for aspect ratios, and format validation (`--check` mode).
- Configured `art_raw/` for raw art inputs with subdirectories (`rooms`, `characters`, `items`, `ui`), keeping raw art files out of git via `.gitignore`.
- Added pytest test suite in `tools/test_process_assets.py` covering crop, padding, resize, filename sanitization, and checker logic.
- Updated `docs/04_ARCHITECTURE_AND_RULES.md` documenting that `tools/` is outside the Flutter application and `art_raw/` is kept out of git.

### Step 3.5 Decisions & Details
- Added asset license tracker in `docs/07_ASSET_LICENSES.md` to audit licenses for all external and AI-generated assets.
- Added hard rule 11 to `docs/04_ARCHITECTURE_AND_RULES.md` requiring every asset added to `assets/` to be documented in `docs/07_ASSET_LICENSES.md` in the same commit.
- Pre-filled starting entries for offline bundled fonts (`LilitaOne`, `Nunito`) under SIL OFL 1.1.

### Step 3 Decisions & Details
- Station baseUpgradeCost values added:
  - `espresso_bar`: 10
  - `cold_drinks_bar`: 250
  - `sandwich_grill`: 2000
  - `burrito_wrap_table`: 15000
  - `pizza_oven`: 125000
  - `bakery`: 1000000
  - `cake_display`: 7500000
- Regular relationship progression constants added to `GameConstants`:
  - `regularRelationshipThresholds`: `[10, 30, 70, 150, 300]` points for levels 1..5
  - `regularBonusPerLevel`: 0.02 (+2% income per level)
  - `regularPointsPerServe`: 1 point
  - `regularPointsPerFavoriteServe`: 3 points
- Created pure Dart domain entities and interfaces with zero Flutter/Flame dependencies:
  - `ItemCategory`, `MenuItem`, `StationDefinition`, `Regular`, `DayPhase`, `demandMultiplier`.
  - Interfaces: `MenuRepository`, `RegularsRepository`.
  - Const implementations: `ConstMenuRepository`, `ConstRegularsRepository` with O(1) cached lookup maps and test injection support.
- Split station definitions into individual files under `lib/features/menu/data/stations/` for maintainability and small file sizes.
- Added `AssetPaths` helper in `lib/core/constants/asset_paths.dart` and migrated `HudBar` to use its constants.
- Updated documentation files `docs/01_GAME_DESIGN.md` and `docs/02_MENU_DATA.md` with the new tables and conventions.

### Step 2.5 Decisions & Details
- Fonts bundled offline in `assets/fonts/` and declared in `pubspec.yaml`:
  - `assets/fonts/LilitaOne-Regular.ttf` (family: `LilitaOne`)
  - `assets/fonts/Nunito-Regular.ttf` (family: `Nunito`, weight: 400)
  - `assets/fonts/Nunito-SemiBold.ttf` (family: `Nunito`, weight: 600)
  - `assets/fonts/Nunito-Bold.ttf` (family: `Nunito`, weight: 700)
  - `assets/fonts/Nunito-ExtraBold.ttf` (family: `Nunito`, weight: 800)
  - License files preserved in `assets/fonts/licenses/` (`Lilita_One/OFL.txt`, `Nunito/OFL.txt`, `OFL-LilitaOne.txt`, `OFL-Nunito.txt`).
- Network font package completely removed from project dependencies and codebase.
- Theme text styles updated to direct `TextStyle(fontFamily: ...)` references.

### Step 2 Decisions & Details
- Added `lib/core/widgets/` for reusable widgets (`AssetImageWithFallback`, `PlaceholderPanel`) and updated `docs/04_ARCHITECTURE_AND_RULES.md` structure list.
- Currency icon colors in HUD:
  - Coins: `AppColors.caramel` (warm gold tone) with `Icons.monetization_on_rounded`.
  - Golden Beans: `AppColors.berry` (vibrant premium tone) with `Icons.coffee_rounded`.
  This pair provides the highest contrast and distinction on the cream pill background.
- Wrapped `PlaceholderPanel` in `SingleChildScrollView` to guarantee zero overflow on tiny 320x480 screens even at 1.5x text scale.
- TODO for Step 4: Replace temporary HUD values (`coins = 1250000`, `goldenBeans = 12` in `lib/features/cafe/presentation/app_shell.dart`) with dynamic Provider game state.

### Step 1 Decisions & Versions
- Packages added:
  - `flame`: 1.35.1 (^1.35.1)
  - `provider`: 6.1.5+1 (^6.1.5+1)
  - `hive`: 2.2.3 (^2.2.3)
  - `hive_flutter`: 1.1.0 (^1.1.0)
  - Bundled offline fonts (`LilitaOne`, `Nunito`)
  - Dev dependencies retained: `flutter_test` (sdk: flutter), `flutter_lints` (^6.0.0)
- Decisions:
  - Extracted `PaletteSwatches` into `lib/features/cafe/presentation/palette_swatches.dart` to keep both `setup_check_screen.dart` and the swatch widget well under 100 lines.
  - Configured `CardThemeData` for `ThemeData.cardTheme` per current Flutter 3.38 API requirements.
  - Specified const hex ARGB values for time-of-day tints (`morningTint = 0x1AE8A24A` [10%], `eveningTint = 0x26D9663B` [15%], `nightTint = 0x594A6FA5` [35%]) so they remain compile-time constants without external color dependencies.
  - Configured linter rules in `analysis_options.yaml` (`prefer_const_constructors`, `prefer_const_declarations`, `avoid_print`, `unused_import: error`, `always_use_package_imports`) and verified 0 analyzer issues across the project.
