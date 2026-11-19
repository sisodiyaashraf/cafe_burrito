import 'package:cafe_burrito/features/menu/domain/item_category.dart';

class MenuItem {
  const MenuItem({
    required this.id,
    required this.name,
    required this.category,
    required this.basePrice,
    required this.prepSeconds,
    required this.unlockStationLevel,
  });

  final String id;
  final String name;
  final ItemCategory category;
  final double basePrice;
  final double prepSeconds;
  final int unlockStationLevel;
}
