import 'package:flutter_test/flutter_test.dart';
import 'package:cafe_burrito/core/constants/asset_paths.dart';

void main() {
  group('AssetPaths', () {
    test('builds correct asset paths', () {
      expect(AssetPaths.itemIcon('latte'), 'assets/images/items/item_latte.png');
      expect(
        AssetPaths.roomBackground('pizza_oven'),
        'assets/images/rooms/room_pizza_oven.png',
      );
      expect(
        AssetPaths.customer('mocha_dog'),
        'assets/images/characters/customer_mocha_dog.png',
      );
      expect(AssetPaths.coinIcon, 'assets/images/ui/ui_coin.png');
      expect(
        AssetPaths.goldenBeanIcon,
        'assets/images/ui/ui_golden_bean.png',
      );
      expect(
        AssetPaths.baristaBody,
        'assets/images/characters/barista_body.png',
      );
      expect(
        AssetPaths.burrito,
        'assets/images/characters/burrito_cat.png',
      );
    });
  });
}
