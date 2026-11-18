import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cafe_burrito/app.dart';
import 'package:cafe_burrito/core/theme/app_colors.dart';
import 'package:cafe_burrito/features/hud/presentation/currency_pill.dart';

void main() {
  testWidgets('App shell displays nav items and HUD amounts', (tester) async {
    await tester.pumpWidget(const CafeBurritoApp());

    expect(find.text('Cafe'), findsOneWidget);
    expect(find.text('Regulars'), findsOneWidget);
    expect(find.text('Shop'), findsOneWidget);
    expect(find.text('1.2M'), findsOneWidget);
    expect(find.text('12'), findsOneWidget);
  });

  testWidgets('Bottom navigation switches tabs properly', (tester) async {
    await tester.pumpWidget(const CafeBurritoApp());

    expect(find.text('The cafe scene arrives in Step 5.'), findsOneWidget);

    await tester.tap(find.text('Shop'));
    await tester.pumpAndSettle();
    expect(
      find.text('Coins, Golden Beans and boosts arrive in a later step.'),
      findsOneWidget,
    );

    await tester.tap(find.text('Regulars'));
    await tester.pumpAndSettle();
    expect(
      find.text('Meet your favorite customers here in a later step.'),
      findsOneWidget,
    );

    await tester.tap(find.text('Cafe'));
    await tester.pumpAndSettle();
    expect(find.text('The cafe scene arrives in Step 5.'), findsOneWidget);
  });

  testWidgets('Settings button opens settings screen and back returns', (
    tester,
  ) async {
    await tester.pumpWidget(const CafeBurritoApp());

    await tester.tap(find.byTooltip('Settings'));
    await tester.pumpAndSettle();

    expect(find.widgetWithText(AppBar, 'Settings'), findsOneWidget);

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(find.byTooltip('Settings'), findsOneWidget);
  });

  group('Responsive overflow tests', () {
    const testSizes = [
      Size(320, 480),
      Size(360, 640),
      Size(411, 891),
      Size(800, 1280),
    ];

    for (final size in testSizes) {
      testWidgets('No overflow on ${size.width}x${size.height}', (
        tester,
      ) async {
        tester.view.physicalSize = size;
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.reset);

        await tester.pumpWidget(const CafeBurritoApp());
        await tester.pumpAndSettle();

        expect(tester.takeException(), isNull);
      });
    }

    testWidgets('No overflow on 320x480 with textScaler 1.5', (tester) async {
      tester.view.physicalSize = const Size(320, 480);
      tester.view.devicePixelRatio = 1.0;
      tester.platformDispatcher.textScaleFactorTestValue = 1.5;
      addTearDown(() {
        tester.view.reset();
        tester.platformDispatcher.clearTextScaleFactorTestValue();
      });

      await tester.pumpWidget(const CafeBurritoApp());
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
    });
  });

  testWidgets('CurrencyPill with 1e18 in 120px container does not overflow', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 120,
              child: CurrencyPill(
                amount: 1e18,
                assetPath: 'assets/images/ui/ui_coin.png',
                fallbackIcon: Icons.monetization_on_rounded,
                fallbackColor: AppColors.caramel,
                semanticLabel: 'Coins',
              ),
            ),
          ),
        ),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(find.text('1Qi'), findsOneWidget);
  });
}
