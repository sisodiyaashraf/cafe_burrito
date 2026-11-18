import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafe_burrito/core/theme/app_colors.dart';

TextTheme createAppTextTheme() {
  return TextTheme(
    displayLarge: GoogleFonts.lilitaOne(
      fontSize: 57,
      color: AppColors.espresso,
    ),
    displayMedium: GoogleFonts.lilitaOne(
      fontSize: 45,
      color: AppColors.espresso,
    ),
    displaySmall: GoogleFonts.lilitaOne(
      fontSize: 36,
      color: AppColors.espresso,
    ),
    headlineLarge: GoogleFonts.lilitaOne(
      fontSize: 32,
      color: AppColors.espresso,
    ),
    headlineMedium: GoogleFonts.lilitaOne(
      fontSize: 28,
      color: AppColors.espresso,
    ),
    headlineSmall: GoogleFonts.lilitaOne(
      fontSize: 24,
      color: AppColors.espresso,
    ),
    titleLarge: GoogleFonts.lilitaOne(
      fontSize: 22,
      color: AppColors.espresso,
    ),
    titleMedium: GoogleFonts.lilitaOne(
      fontSize: 16,
      color: AppColors.espresso,
    ),
    titleSmall: GoogleFonts.lilitaOne(
      fontSize: 14,
      color: AppColors.espresso,
    ),
    bodyLarge: GoogleFonts.nunito(
      fontSize: 16,
      color: AppColors.espresso,
    ),
    bodyMedium: GoogleFonts.nunito(
      fontSize: 14,
      color: AppColors.espresso,
    ),
    bodySmall: GoogleFonts.nunito(
      fontSize: 12,
      color: AppColors.espresso,
    ),
    labelLarge: GoogleFonts.nunito(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.espresso,
    ),
    labelMedium: GoogleFonts.nunito(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: AppColors.espresso,
    ),
    labelSmall: GoogleFonts.nunito(
      fontSize: 11,
      fontWeight: FontWeight.bold,
      color: AppColors.espresso,
    ),
  );
}
