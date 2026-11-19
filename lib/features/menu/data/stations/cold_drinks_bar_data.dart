import 'package:cafe_burrito/features/menu/domain/item_category.dart';
import 'package:cafe_burrito/features/menu/domain/menu_item.dart';
import 'package:cafe_burrito/features/menu/domain/station_definition.dart';

const StationDefinition coldDrinksBar = StationDefinition(
  id: 'cold_drinks_bar',
  name: 'Cold Drinks Bar',
  category: ItemCategory.coldDrink,
  unlockCost: 500,
  baseUpgradeCost: 250,
  items: [
    MenuItem(
      id: 'cold_coffee',
      name: 'Cold Coffee',
      category: ItemCategory.coldDrink,
      basePrice: 30,
      prepSeconds: 3.0,
      unlockStationLevel: 1,
    ),
    MenuItem(
      id: 'iced_latte',
      name: 'Iced Latte',
      category: ItemCategory.coldDrink,
      basePrice: 48,
      prepSeconds: 3.5,
      unlockStationLevel: 10,
    ),
    MenuItem(
      id: 'frappe',
      name: 'Frappe',
      category: ItemCategory.coldDrink,
      basePrice: 75,
      prepSeconds: 4.0,
      unlockStationLevel: 25,
    ),
    MenuItem(
      id: 'cold_brew',
      name: 'Cold Brew',
      category: ItemCategory.coldDrink,
      basePrice: 110,
      prepSeconds: 4.5,
      unlockStationLevel: 50,
    ),
  ],
);
