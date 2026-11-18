import 'package:flutter/material.dart';
import 'package:cafe_burrito/core/constants/app_sizes.dart';
import 'package:cafe_burrito/core/theme/app_colors.dart';
import 'package:cafe_burrito/core/theme/app_text_styles.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    const colorScheme = ColorScheme.light(
      primary: AppColors.terracotta,
      onPrimary: AppColors.cream,
      secondary: AppColors.caramel,
      onSecondary: AppColors.espresso,
      tertiary: AppColors.mint,
      onTertiary: AppColors.espresso,
      surface: AppColors.cream,
      onSurface: AppColors.espresso,
      error: AppColors.berry,
      onError: AppColors.cream,
    );

    final textTheme = createAppTextTheme();

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.cream,
      textTheme: textTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.cream,
        foregroundColor: AppColors.espresso,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.terracotta,
          foregroundColor: AppColors.cream,
          minimumSize: const Size(
            AppSizes.minTapTarget,
            AppSizes.minTapTarget,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            side: const BorderSide(
              color: AppColors.espresso,
              width: AppSizes.outlineWidth,
            ),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.cream,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
          side: const BorderSide(
            color: AppColors.espresso,
            width: AppSizes.outlineWidth,
          ),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.cream,
        indicatorColor: AppColors.terracotta,
        elevation: 0,
        height: 72,
        iconTheme: const WidgetStatePropertyAll(
          IconThemeData(color: AppColors.espresso),
        ),
        labelTextStyle: WidgetStatePropertyAll(
          textTheme.labelSmall?.copyWith(
            color: AppColors.espresso,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
