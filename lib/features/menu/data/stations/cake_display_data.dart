import 'package:cafe_burrito/features/menu/domain/item_category.dart';
import 'package:cafe_burrito/features/menu/domain/menu_item.dart';
import 'package:cafe_burrito/features/menu/domain/station_definition.dart';

const StationDefinition cakeDisplay = StationDefinition(
  id: 'cake_display',
  name: 'Cake Display',
  category: ItemCategory.cake,
  unlockCost: 15000000,
  baseUpgradeCost: 7500000,
  items: [
    MenuItem(
      id: 'brownie',
      name: 'Brownie',
      category: ItemCategory.cake,
      basePrice: 260000,
      prepSeconds: 7.0,
      unlockStationLevel: 1,
    ),
    MenuItem(
      id: 'choc_cake_slice',
      name: 'Chocolate Cake Slice',
      category: ItemCategory.cake,
      basePrice: 400000,
      prepSeconds: 7.5,
      unlockStationLevel: 10,
    ),
    MenuItem(
      id: 'cheesecake',
      name: 'Cheesecake',
      category: ItemCategory.cake,
      basePrice: 620000,
      prepSeconds: 8.0,
      unlockStationLevel: 25,
    ),
    MenuItem(
      id: 'red_velvet_slice',
      name: 'Red Velvet Slice',
      category: ItemCategory.cake,
      basePrice: 950000,
      prepSeconds: 8.5,
      unlockStationLevel: 50,
    ),
  ],
);
