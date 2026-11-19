import 'package:cafe_burrito/core/constants/game_constants.dart';
import 'package:cafe_burrito/features/cafe/domain/day_phase.dart';
import 'package:cafe_burrito/features/menu/domain/item_category.dart';

const Map<DayPhase, Set<ItemCategory>> _rushCategories = {
  DayPhase.morning: {
    ItemCategory.hotCoffee,
    ItemCategory.coldDrink,
  },
  DayPhase.lunch: {
    ItemCategory.sandwich,
    ItemCategory.burrito,
    ItemCategory.pizza,
  },
  DayPhase.evening: {
    ItemCategory.bakery,
    ItemCategory.cake,
  },
  DayPhase.night: {},
};

double demandMultiplier(ItemCategory category, DayPhase phase) {
  if (phase == DayPhase.night) {
    return GameConstants.nightDemandMultiplier;
  }
  final rushed = _rushCategories[phase];
  if (rushed != null && rushed.contains(category)) {
    return GameConstants.rushDemandMultiplier.toDouble();
  }
  return 1.0;
}
