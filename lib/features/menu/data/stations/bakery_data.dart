import 'package:cafe_burrito/features/menu/domain/item_category.dart';
import 'package:cafe_burrito/features/menu/domain/menu_item.dart';
import 'package:cafe_burrito/features/menu/domain/station_definition.dart';

const StationDefinition bakery = StationDefinition(
  id: 'bakery',
  name: 'Bakery',
  category: ItemCategory.bakery,
  unlockCost: 2000000,
  baseUpgradeCost: 1000000,
  items: [
    MenuItem(
      id: 'choc_chip_cookie',
      name: 'Choc Chip Cookie',
      category: ItemCategory.bakery,
      basePrice: 45000,
      prepSeconds: 5.0,
      unlockStationLevel: 1,
    ),
    MenuItem(
      id: 'oatmeal_cookie',
      name: 'Oatmeal Cookie',
      category: ItemCategory.bakery,
      basePrice: 70000,
      prepSeconds: 5.5,
      unlockStationLevel: 10,
    ),
    MenuItem(
      id: 'croissant',
      name: 'Croissant',
      category: ItemCategory.bakery,
      basePrice: 110000,
      prepSeconds: 6.0,
      unlockStationLevel: 25,
    ),
    MenuItem(
      id: 'cinnamon_roll',
      name: 'Cinnamon Roll',
      category: ItemCategory.bakery,
      basePrice: 170000,
      prepSeconds: 6.5,
      unlockStationLevel: 50,
    ),
  ],
);
