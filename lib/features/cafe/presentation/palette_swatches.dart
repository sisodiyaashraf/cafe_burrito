import 'package:flutter/material.dart';
import 'package:cafe_burrito/core/constants/app_sizes.dart';
import 'package:cafe_burrito/core/theme/app_colors.dart';

class PaletteSwatches extends StatelessWidget {
  const PaletteSwatches({super.key});

  static const List<(String, Color)> _swatches = [
    ('Espresso', AppColors.espresso),
    ('Cream', AppColors.cream),
    ('Terracotta', AppColors.terracotta),
    ('Caramel', AppColors.caramel),
    ('Mint', AppColors.mint),
    ('Berry', AppColors.berry),
    ('Blueberry', AppColors.blueberry),
    ('White', AppColors.white),
  ];

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelSmall;

    return Wrap(
      spacing: AppSizes.sm,
      runSpacing: AppSizes.sm,
      alignment: WrapAlignment.center,
      children: _swatches.map((item) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: item.$2,
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                border: Border.all(
                  color: AppColors.espresso,
                  width: AppSizes.outlineWidth,
                ),
              ),
            ),
            const SizedBox(height: AppSizes.xs),
            Text(item.$1, style: textStyle),
          ],
        );
      }).toList(),
    );
  }
}
