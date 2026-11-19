import 'package:cafe_burrito/features/menu/domain/item_category.dart';
import 'package:cafe_burrito/features/menu/domain/menu_item.dart';

class StationDefinition {
  const StationDefinition({
    required this.id,
    required this.name,
    required this.category,
    required this.unlockCost,
    required this.baseUpgradeCost,
    required this.items,
  });

  final String id;
  final String name;
  final ItemCategory category;
  final double unlockCost;
  final double baseUpgradeCost;
  final List<MenuItem> items;

  MenuItem get firstItem => items.first;
}
