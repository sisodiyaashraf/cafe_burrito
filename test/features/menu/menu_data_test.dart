import 'package:flutter_test/flutter_test.dart';
import 'package:cafe_burrito/core/constants/game_constants.dart';
import 'package:cafe_burrito/features/menu/data/menu_catalog.dart';

void main() {
  group('Menu data specifications', () {
    test('has exactly 7 stations and 28 items (4 per station)', () {
      expect(menuStations.length, 7);
      for (final station in menuStations) {
        expect(station.items.length, 4);
      }
      final totalItems = menuStations.fold<int>(
        0,
        (sum, s) => sum + s.items.length,
      );
      expect(totalItems, 28);
    });

    test('all station ids and item ids are unique', () {
      final stationIds = menuStations.map((s) => s.id).toSet();
      expect(stationIds.length, 7);

      final allItemIds =
          menuStations.expand((s) => s.items).map((i) => i.id).toSet();
      expect(allItemIds.length, 28);
    });

    test('every item category matches its parent station category', () {
      for (final station in menuStations) {
        for (final item in station.items) {
          expect(item.category, station.category);
        }
      }
    });

    test('unlock levels follow milestone progression [1, 10, 25, 50]', () {
      final expectedLevels = [
        1,
        ...GameConstants.milestoneLevels.take(3),
      ];

      for (final station in menuStations) {
        final levels = station.items.map((i) => i.unlockStationLevel).toList();
        expect(levels, [1, 10, 25, 50]);
        expect(levels, expectedLevels);
      }
    });

    test('prices strictly increase within stations and across stations', () {
      double previousStationMaxPrice = -1;

      for (final station in menuStations) {
        for (var i = 0; i < station.items.length - 1; i++) {
          expect(
            station.items[i].basePrice < station.items[i + 1].basePrice,
            isTrue,
          );
        }

        final cheapestPrice = station.items.first.basePrice;
        if (previousStationMaxPrice >= 0) {
          expect(cheapestPrice > previousStationMaxPrice, isTrue);
        }
        previousStationMaxPrice = station.items.last.basePrice;
      }
    });

    test('prep seconds are positive and non-decreasing within each station', () {
      for (final station in menuStations) {
        for (var i = 0; i < station.items.length; i++) {
          expect(station.items[i].prepSeconds > 0, isTrue);
          if (i < station.items.length - 1) {
            expect(
              station.items[i].prepSeconds <= station.items[i + 1].prepSeconds,
              isTrue,
            );
          }
        }
      }
    });

    test('unlock costs start at 0 and strictly increase across stations', () {
      expect(menuStations.first.unlockCost, 0);

      for (var i = 0; i < menuStations.length - 1; i++) {
        expect(
          menuStations[i].unlockCost < menuStations[i + 1].unlockCost,
          isTrue,
        );
      }
    });

    test('baseUpgradeCosts are positive and strictly increase', () {
      for (var i = 0; i < menuStations.length; i++) {
        expect(menuStations[i].baseUpgradeCost > 0, isTrue);
        if (i < menuStations.length - 1) {
          expect(
            menuStations[i].baseUpgradeCost <
                menuStations[i + 1].baseUpgradeCost,
            isTrue,
          );
        }
      }
    });
  });
}
