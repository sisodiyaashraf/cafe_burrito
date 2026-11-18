import 'package:flutter/material.dart';
import 'package:cafe_burrito/core/constants/app_sizes.dart';
import 'package:cafe_burrito/core/theme/app_colors.dart';

class PlaceholderPanel extends StatelessWidget {
  const PlaceholderPanel({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: const BoxDecoration(
                color: AppColors.cream,
                shape: BoxShape.circle,
                border: Border.fromBorderSide(
                  BorderSide(
                    color: AppColors.espresso,
                    width: AppSizes.outlineWidth,
                  ),
                ),
              ),
              child: Icon(
                icon,
                size: 48,
                color: AppColors.espresso,
              ),
            ),
            const SizedBox(height: AppSizes.md),
            Text(
              title,
              style: textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSizes.sm),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 320),
              child: Text(
                subtitle,
                style: textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
