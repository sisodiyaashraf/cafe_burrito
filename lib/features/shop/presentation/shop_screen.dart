import 'package:flutter/material.dart';
import 'package:cafe_burrito/core/widgets/placeholder_panel.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPanel(
      icon: Icons.storefront_rounded,
      title: 'Shop',
      subtitle: 'Coins, Golden Beans and boosts arrive in a later step.',
    );
  }
}
