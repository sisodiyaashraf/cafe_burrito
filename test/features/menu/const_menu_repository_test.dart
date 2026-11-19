import 'package:flutter_test/flutter_test.dart';
import 'package:cafe_burrito/features/menu/data/const_menu_repository.dart';
import 'package:cafe_burrito/features/menu/domain/item_category.dart';
import 'package:cafe_burrito/features/menu/domain/menu_item.dart';
import 'package:cafe_burrito/features/menu/domain/station_definition.dart';

void main() {
  group('ConstMenuRepository', () {
    final repo = ConstMenuRepository();

    test('returns stations and allItems', () {
      expect(repo.stations.length, 7);
      expect(repo.allItems.length, 28);
    });

    test('stationById, itemById, stationOfItem return expected entities', () {
      final espressoStation = repo.stationById('espresso_bar');
      expect(espressoStation.name, 'Espresso Bar');

      final cappuccino = repo.itemById('cappuccino');
      expect(cappuccino.name, 'Cappuccino');
      expect(repo.stationOfItem('cappuccino').id, 'espresso_bar');

      final cheesecake = repo.itemById('cheesecake');
      expect(cheesecake.name, 'Cheesecake');
      expect(repo.stationOfItem('cheesecake').id, 'cake_display');
    });

    test('unknown ids throw ArgumentError', () {
      expect(() => repo.stationById('unknown_station'), throwsArgumentError);
      expect(() => repo.itemById('unknown_item'), throwsArgumentError);
      expect(() => repo.stationOfItem('unknown_item'), throwsArgumentError);
    });

    test('supports custom injected stations', () {
      const customStation = StationDefinition(
        id: 'test_station',
        name: 'Test Station',
        category: ItemCategory.bakery,
        unlockCost: 0,
        baseUpgradeCost: 10,
        items: [
          MenuItem(
            id: 'test_cookie',
            name: 'Test Cookie',
            category: ItemCategory.bakery,
            basePrice: 50,
            prepSeconds: 2.0,
            unlockStationLevel: 1,
          ),
        ],
      );

      final customRepo = ConstMenuRepository([customStation]);
      expect(customRepo.stations.length, 1);
      expect(customRepo.allItems.length, 1);
      expect(customRepo.stationById('test_station').id, 'test_station');
      expect(customRepo.itemById('test_cookie').id, 'test_cookie');
      expect(
        customRepo.stationOfItem('test_cookie').id,
        'test_station',
      );
    });
  });
}
