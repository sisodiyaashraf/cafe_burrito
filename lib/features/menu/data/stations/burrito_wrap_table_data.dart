import 'package:cafe_burrito/features/menu/domain/item_category.dart';
import 'package:cafe_burrito/features/menu/domain/menu_item.dart';
import 'package:cafe_burrito/features/menu/domain/station_definition.dart';

const StationDefinition burritoWrapTable = StationDefinition(
  id: 'burrito_wrap_table',
  name: 'Burrito Wrap Table',
  category: ItemCategory.burrito,
  unlockCost: 30000,
  baseUpgradeCost: 15000,
  items: [
    MenuItem(
      id: 'veg_burrito',
      name: 'Veg Burrito',
      category: ItemCategory.burrito,
      basePrice: 1200,
      prepSeconds: 5.0,
      unlockStationLevel: 1,
    ),
    MenuItem(
      id: 'chicken_burrito',
      name: 'Chicken Burrito',
      category: ItemCategory.burrito,
      basePrice: 1900,
      prepSeconds: 5.5,
      unlockStationLevel: 10,
    ),
    MenuItem(
      id: 'breakfast_burrito',
      name: 'Breakfast Burrito',
      category: ItemCategory.burrito,
      basePrice: 3000,
      prepSeconds: 6.0,
      unlockStationLevel: 25,
    ),
    MenuItem(
      id: 'loaded_burrito',
      name: 'Loaded Burrito',
      category: ItemCategory.burrito,
      basePrice: 4800,
      prepSeconds: 6.5,
      unlockStationLevel: 50,
    ),
  ],
);
