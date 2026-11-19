import 'package:cafe_burrito/features/menu/domain/item_category.dart';
import 'package:cafe_burrito/features/menu/domain/menu_item.dart';
import 'package:cafe_burrito/features/menu/domain/station_definition.dart';

const StationDefinition espressoBar = StationDefinition(
  id: 'espresso_bar',
  name: 'Espresso Bar',
  category: ItemCategory.hotCoffee,
  unlockCost: 0,
  baseUpgradeCost: 10,
  items: [
    MenuItem(
      id: 'espresso',
      name: 'Espresso',
      category: ItemCategory.hotCoffee,
      basePrice: 5,
      prepSeconds: 2.0,
      unlockStationLevel: 1,
    ),
    MenuItem(
      id: 'americano',
      name: 'Americano',
      category: ItemCategory.hotCoffee,
      basePrice: 8,
      prepSeconds: 2.5,
      unlockStationLevel: 10,
    ),
    MenuItem(
      id: 'cappuccino',
      name: 'Cappuccino',
      category: ItemCategory.hotCoffee,
      basePrice: 14,
      prepSeconds: 3.0,
      unlockStationLevel: 25,
    ),
    MenuItem(
      id: 'latte',
      name: 'Latte',
      category: ItemCategory.hotCoffee,
      basePrice: 22,
      prepSeconds: 3.5,
      unlockStationLevel: 50,
    ),
  ],
);
