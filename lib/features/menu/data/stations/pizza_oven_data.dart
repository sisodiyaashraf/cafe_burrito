import 'package:cafe_burrito/features/menu/domain/item_category.dart';
import 'package:cafe_burrito/features/menu/domain/menu_item.dart';
import 'package:cafe_burrito/features/menu/domain/station_definition.dart';

const StationDefinition pizzaOven = StationDefinition(
  id: 'pizza_oven',
  name: 'Pizza Oven',
  category: ItemCategory.pizza,
  unlockCost: 250000,
  baseUpgradeCost: 125000,
  items: [
    MenuItem(
      id: 'margherita_slice',
      name: 'Margherita Slice',
      category: ItemCategory.pizza,
      basePrice: 7500,
      prepSeconds: 6.0,
      unlockStationLevel: 1,
    ),
    MenuItem(
      id: 'pepperoni_slice',
      name: 'Pepperoni Slice',
      category: ItemCategory.pizza,
      basePrice: 12000,
      prepSeconds: 6.5,
      unlockStationLevel: 10,
    ),
    MenuItem(
      id: 'veggie_slice',
      name: 'Veggie Slice',
      category: ItemCategory.pizza,
      basePrice: 19000,
      prepSeconds: 7.0,
      unlockStationLevel: 25,
    ),
    MenuItem(
      id: 'cheese_burst_slice',
      name: 'Cheese Burst Slice',
      category: ItemCategory.pizza,
      basePrice: 30000,
      prepSeconds: 7.5,
      unlockStationLevel: 50,
    ),
  ],
);
