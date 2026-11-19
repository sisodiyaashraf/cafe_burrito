import 'package:cafe_burrito/features/menu/domain/item_category.dart';
import 'package:cafe_burrito/features/menu/domain/menu_item.dart';
import 'package:cafe_burrito/features/menu/domain/station_definition.dart';

const StationDefinition sandwichGrill = StationDefinition(
  id: 'sandwich_grill',
  name: 'Sandwich Grill',
  category: ItemCategory.sandwich,
  unlockCost: 4000,
  baseUpgradeCost: 2000,
  items: [
    MenuItem(
      id: 'grilled_cheese',
      name: 'Grilled Cheese',
      category: ItemCategory.sandwich,
      basePrice: 200,
      prepSeconds: 4.0,
      unlockStationLevel: 1,
    ),
    MenuItem(
      id: 'egg_sandwich',
      name: 'Egg Sandwich',
      category: ItemCategory.sandwich,
      basePrice: 320,
      prepSeconds: 4.5,
      unlockStationLevel: 10,
    ),
    MenuItem(
      id: 'club_sandwich',
      name: 'Club Sandwich',
      category: ItemCategory.sandwich,
      basePrice: 500,
      prepSeconds: 5.0,
      unlockStationLevel: 25,
    ),
    MenuItem(
      id: 'veggie_melt',
      name: 'Veggie Melt',
      category: ItemCategory.sandwich,
      basePrice: 800,
      prepSeconds: 5.5,
      unlockStationLevel: 50,
    ),
  ],
);
