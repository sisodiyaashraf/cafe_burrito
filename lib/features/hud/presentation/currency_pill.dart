import 'package:flutter/material.dart';
import 'package:cafe_burrito/core/constants/app_sizes.dart';
import 'package:cafe_burrito/core/theme/app_colors.dart';
import 'package:cafe_burrito/core/utils/number_formatter.dart';
import 'package:cafe_burrito/core/widgets/asset_image_with_fallback.dart';

class CurrencyPill extends StatelessWidget {
  const CurrencyPill({
    super.key,
    required this.amount,
    required this.assetPath,
    required this.fallbackIcon,
    required this.fallbackColor,
    required this.semanticLabel,
  });

  final double amount;
  final String assetPath;
  final IconData fallbackIcon;
  final Color fallbackColor;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final formatted = formatCompact(amount);

    return Semantics(
      label: '$semanticLabel: $formatted',
      child: Container(
        constraints: const BoxConstraints(minHeight: 40),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.sm,
          vertical: AppSizes.xs,
        ),
        decoration: BoxDecoration(
          color: AppColors.cream,
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          border: Border.all(
            color: AppColors.espresso,
            width: AppSizes.outlineWidth,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AssetImageWithFallback(
              assetPath: assetPath,
              size: 28,
              fallback: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: fallbackColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.espresso,
                    width: AppSizes.outlineWidth,
                  ),
                ),
                child: Icon(
                  fallbackIcon,
                  size: 16,
                  color: AppColors.espresso,
                ),
              ),
            ),
            const SizedBox(width: AppSizes.xs),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  formatted,
                  style: textTheme.titleLarge?.copyWith(
                    color: AppColors.espresso,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
