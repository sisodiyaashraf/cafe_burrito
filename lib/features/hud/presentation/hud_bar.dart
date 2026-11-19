import 'package:flutter/material.dart';
import 'package:cafe_burrito/core/constants/app_sizes.dart';
import 'package:cafe_burrito/core/constants/asset_paths.dart';
import 'package:cafe_burrito/core/theme/app_colors.dart';
import 'package:cafe_burrito/features/hud/presentation/currency_pill.dart';
import 'package:cafe_burrito/features/hud/presentation/settings_button.dart';

class HudBar extends StatelessWidget {
  const HudBar({
    super.key,
    required this.coins,
    required this.goldenBeans,
    required this.onSettingsTap,
  });

  final double coins;
  final double goldenBeans;
  final VoidCallback onSettingsTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.md,
        vertical: AppSizes.sm,
      ),
      child: Row(
        children: [
          Expanded(
            child: CurrencyPill(
              amount: coins,
              assetPath: AssetPaths.coinIcon,
              fallbackIcon: Icons.monetization_on_rounded,
              fallbackColor: AppColors.caramel,
              semanticLabel: 'Coins',
            ),
          ),
          const SizedBox(width: AppSizes.sm),
          Expanded(
            child: CurrencyPill(
              amount: goldenBeans,
              assetPath: AssetPaths.goldenBeanIcon,
              fallbackIcon: Icons.coffee_rounded,
              fallbackColor: AppColors.berry,
              semanticLabel: 'Golden Beans',
            ),
          ),
          const SizedBox(width: AppSizes.sm),
          SettingsButton(onPressed: onSettingsTap),
        ],
      ),
    );
  }
}
