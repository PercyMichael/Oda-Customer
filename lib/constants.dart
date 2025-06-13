import 'package:flutter/material.dart';

// Colors
class AppColors {
  static const Color primary = Color(0xFF00B2AB);
  static const Color secondary = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF757575);
  static const Color background = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
}

// Fonts
class AppFonts {
  static const String primaryFont = 'Roboto';
  static const String secondaryFont = 'Montserrat';
}

// Text Styles
class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 16,
    color: AppColors.textSecondary,
  );

  static const TextStyle button = TextStyle(
    fontFamily: AppFonts.secondaryFont,
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
