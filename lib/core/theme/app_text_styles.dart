import 'package:flutter/material.dart';
import 'package:cafe_burrito/core/theme/app_colors.dart';

TextTheme createAppTextTheme() {
  const displayFont = 'LilitaOne';
  const bodyFont = 'Nunito';

  return const TextTheme(
    displayLarge: TextStyle(
      fontFamily: displayFont,
      fontSize: 57,
      color: AppColors.espresso,
    ),
    displayMedium: TextStyle(
      fontFamily: displayFont,
      fontSize: 45,
      color: AppColors.espresso,
    ),
    displaySmall: TextStyle(
      fontFamily: displayFont,
      fontSize: 36,
      color: AppColors.espresso,
    ),
    headlineLarge: TextStyle(
      fontFamily: displayFont,
      fontSize: 32,
      color: AppColors.espresso,
    ),
    headlineMedium: TextStyle(
      fontFamily: displayFont,
      fontSize: 28,
      color: AppColors.espresso,
    ),
    headlineSmall: TextStyle(
      fontFamily: displayFont,
      fontSize: 24,
      color: AppColors.espresso,
    ),
    titleLarge: TextStyle(
      fontFamily: displayFont,
      fontSize: 22,
      color: AppColors.espresso,
    ),
    titleMedium: TextStyle(
      fontFamily: displayFont,
      fontSize: 16,
      color: AppColors.espresso,
    ),
    titleSmall: TextStyle(
      fontFamily: displayFont,
      fontSize: 14,
      color: AppColors.espresso,
    ),
    bodyLarge: TextStyle(
      fontFamily: bodyFont,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.espresso,
    ),
    bodyMedium: TextStyle(
      fontFamily: bodyFont,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.espresso,
    ),
    bodySmall: TextStyle(
      fontFamily: bodyFont,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.espresso,
    ),
    labelLarge: TextStyle(
      fontFamily: bodyFont,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.espresso,
    ),
    labelMedium: TextStyle(
      fontFamily: bodyFont,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: AppColors.espresso,
    ),
    labelSmall: TextStyle(
      fontFamily: bodyFont,
      fontSize: 11,
      fontWeight: FontWeight.bold,
      color: AppColors.espresso,
    ),
  );
}
