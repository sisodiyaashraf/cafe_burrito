# Architecture and coding rules

## Stack
Flutter, flame, provider, hive and hive_flutter, google_fonts, flame_audio, google_mobile_ads, in_app_purchase (the last three are added in their own steps).

## Structure (Clean Architecture)
lib/
  main.dart
  app.dart
  core/{constants,theme,utils,widgets,ads,audio}
  features/
    cafe/{domain,data,presentation}
    menu/{domain,data}
    customers/{domain,presentation}
    regulars/{domain,data,presentation}
    upgrades/{domain,presentation}
    shop/{domain,data,presentation}
    settings/presentation
    hud/presentation
- domain: entities and pure logic (no Flutter or Flame imports).
- data: repositories, Hive storage, const menu data.
- presentation: widgets, Flame components, ChangeNotifier state classes.

## Responsibility split
- Flame = the world: station rooms, baristas, customers, item movement, particles.
- Flutter widgets = HUD, buttons, popups, shop, regulars screen, as overlays.
- Provider ChangeNotifier classes are shared by both.

## Hard rules
1. Provider for state management.
2. Minimal inline comments; names must explain the code.
3. Each Dart file max 150 to 180 lines (under 100 if not core). If a file grows, split it into smaller files.
4. All UI responsive on every screen size with no overflow errors. Use LayoutBuilder, Flexible, FittedBox, MediaQuery, safe areas. Minimum tap target 48x48 dp.
5. No magic numbers: all balance values in core/constants. No hardcoded colors: use the theme palette.
6. Menu, stations, and regulars come only from data files.
7. Placeholders (colored shapes) are allowed until real art exists; every asset load must fall back to a placeholder if missing.
8. Domain logic must have unit tests.
9. Never rewrite unrelated files. Make the smallest change that solves the task.
10. After each step: list created and changed files, how to run, how to test, and update docs/06_PROGRESS.md.

## Git
Commit after each step with message: `step-N: short description`.
