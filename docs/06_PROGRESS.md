# Progress
- [x] Step 0: Documentation
- [x] Step 1: Project setup
- [x] Step 2: App shell, bottom navigation, HUD
(Update this checklist after every step. Add notes about decisions and known issues below.)

## Notes
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
