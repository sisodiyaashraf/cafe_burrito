import 'package:flutter/material.dart';
import 'package:cafe_burrito/core/constants/app_sizes.dart';
import 'package:cafe_burrito/core/theme/app_colors.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Settings',
      child: Material(
        color: AppColors.cream,
        shape: const CircleBorder(
          side: BorderSide(
            color: AppColors.espresso,
            width: AppSizes.outlineWidth,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: const SizedBox(
            width: AppSizes.minTapTarget,
            height: AppSizes.minTapTarget,
            child: Icon(
              Icons.settings_rounded,
              color: AppColors.espresso,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
