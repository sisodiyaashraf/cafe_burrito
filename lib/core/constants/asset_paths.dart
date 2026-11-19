class AssetPaths {
  const AssetPaths._();

  static const String coinIcon = 'assets/images/ui/ui_coin.png';
  static const String goldenBeanIcon = 'assets/images/ui/ui_golden_bean.png';

  static String itemIcon(String itemId) =>
      'assets/images/items/item_$itemId.png';

  static String roomBackground(String stationId) =>
      'assets/images/rooms/room_$stationId.png';

  static String customer(String regularId) =>
      'assets/images/characters/customer_$regularId.png';

  static const String baristaBody = 'assets/images/characters/barista_body.png';
  static const String burrito = 'assets/images/characters/burrito_cat.png';
}
