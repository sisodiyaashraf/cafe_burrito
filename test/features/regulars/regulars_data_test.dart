import 'package:flutter_test/flutter_test.dart';
import 'package:cafe_burrito/features/menu/data/const_menu_repository.dart';
import 'package:cafe_burrito/features/regulars/data/const_regulars_repository.dart';
import 'package:cafe_burrito/features/regulars/data/regulars_data.dart';

void main() {
  group('Regulars data and repository', () {
    final menuRepo = ConstMenuRepository();
    final regularsRepo = ConstRegularsRepository();

    test('has exactly 8 regulars with unique ids', () {
      expect(regularsCatalog.length, 8);
      final ids = regularsCatalog.map((r) => r.id).toSet();
      expect(ids.length, 8);
    });

    test('every favorite item exists in the menu repository', () {
      for (final regular in regularsCatalog) {
        final item = menuRepo.itemById(regular.favoriteItemId);
        expect(item.id, regular.favoriteItemId);
      }
    });

    test('regularsWhoLove finds the right regular or empty list', () {
      final loversOfCappuccino = regularsRepo.regularsWhoLove('cappuccino');
      expect(loversOfCappuccino.length, 1);
      expect(loversOfCappuccino.first.id, 'mocha_dog');

      final loversOfEspresso = regularsRepo.regularsWhoLove('espresso');
      expect(loversOfEspresso, isEmpty);
    });

    test('unknown regular id throws ArgumentError', () {
      expect(
        () => regularsRepo.regularById('nonexistent_regular'),
        throwsArgumentError,
      );
    });
  });
}
