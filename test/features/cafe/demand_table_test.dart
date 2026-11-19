import 'package:flutter_test/flutter_test.dart';
import 'package:cafe_burrito/core/constants/game_constants.dart';
import 'package:cafe_burrito/features/cafe/domain/day_phase.dart';
import 'package:cafe_burrito/features/cafe/domain/demand_table.dart';
import 'package:cafe_burrito/features/menu/domain/item_category.dart';

void main() {
  group('demandMultiplier', () {
    test('checks all 28 category and phase combinations', () {
      final rush = GameConstants.rushDemandMultiplier.toDouble();
      final night = GameConstants.nightDemandMultiplier;

      const morningRush = {
        ItemCategory.hotCoffee,
        ItemCategory.coldDrink,
      };
      const lunchRush = {
        ItemCategory.sandwich,
        ItemCategory.burrito,
        ItemCategory.pizza,
      };
      const eveningRush = {
        ItemCategory.bakery,
        ItemCategory.cake,
      };

      var count = 0;
      for (final phase in DayPhase.values) {
        for (final category in ItemCategory.values) {
          count++;
          final multiplier = demandMultiplier(category, phase);

          switch (phase) {
            case DayPhase.morning:
              if (morningRush.contains(category)) {
                expect(multiplier, rush);
              } else {
                expect(multiplier, 1.0);
              }
              break;
            case DayPhase.lunch:
              if (lunchRush.contains(category)) {
                expect(multiplier, rush);
              } else {
                expect(multiplier, 1.0);
              }
              break;
            case DayPhase.evening:
              if (eveningRush.contains(category)) {
                expect(multiplier, rush);
              } else {
                expect(multiplier, 1.0);
              }
              break;
            case DayPhase.night:
              expect(multiplier, night);
              break;
          }
        }
      }
      expect(count, 28);
    });
  });
}
