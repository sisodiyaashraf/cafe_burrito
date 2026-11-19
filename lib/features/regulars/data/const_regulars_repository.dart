import 'package:cafe_burrito/features/regulars/data/regulars_data.dart';
import 'package:cafe_burrito/features/regulars/domain/regular.dart';
import 'package:cafe_burrito/features/regulars/domain/regulars_repository.dart';

class ConstRegularsRepository implements RegularsRepository {
  ConstRegularsRepository([List<Regular>? regulars])
      : _regulars = regulars ?? regularsCatalog {
    for (final regular in _regulars) {
      _regularById[regular.id] = regular;
      _regularsByFavoriteItem
          .putIfAbsent(regular.favoriteItemId, () => [])
          .add(regular);
    }
  }

  final List<Regular> _regulars;
  final Map<String, Regular> _regularById = {};
  final Map<String, List<Regular>> _regularsByFavoriteItem = {};

  @override
  List<Regular> get regulars => List.unmodifiable(_regulars);

  @override
  Regular regularById(String id) {
    final regular = _regularById[id];
    if (regular == null) {
      throw ArgumentError('Unknown regular id: $id');
    }
    return regular;
  }

  @override
  List<Regular> regularsWhoLove(String itemId) {
    final list = _regularsByFavoriteItem[itemId];
    if (list == null) {
      return const [];
    }
    return List.unmodifiable(list);
  }
}
