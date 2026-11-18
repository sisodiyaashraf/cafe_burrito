# Progress
- [x] Step 0: Documentation
- [x] Step 1: Project setup
(Update this checklist after every step. Add notes about decisions and known issues below.)

## Notes
### Step 1 Decisions & Versions
- Packages added:
  - `flame`: 1.35.1 (^1.35.1)
  - `provider`: 6.1.5+1 (^6.1.5+1)
  - `hive`: 2.2.3 (^2.2.3)
  - `hive_flutter`: 1.1.0 (^1.1.0)
  - `google_fonts`: 8.2.1 (^8.2.1)
  - Dev dependencies retained: `flutter_test` (sdk: flutter), `flutter_lints` (^6.0.0)
- Decisions:
  - Extracted `PaletteSwatches` into `lib/features/cafe/presentation/palette_swatches.dart` to keep both `setup_check_screen.dart` and the swatch widget well under 100 lines.
  - Configured `CardThemeData` for `ThemeData.cardTheme` per current Flutter 3.38 API requirements.
  - Specified const hex ARGB values for time-of-day tints (`morningTint = 0x1AE8A24A` [10%], `eveningTint = 0x26D9663B` [15%], `nightTint = 0x594A6FA5` [35%]) so they remain compile-time constants without external color dependencies.
  - Configured linter rules in `analysis_options.yaml` (`prefer_const_constructors`, `prefer_const_declarations`, `avoid_print`, `unused_import: error`, `always_use_package_imports`) and verified 0 analyzer issues across the project.
