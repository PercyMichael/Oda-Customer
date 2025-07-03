import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
class AppColors {
  static const Color primary = Color(0xFF000000);
  static const Color primaryLight = Color(
    0xFF8BC34A,
  ); // Light green color for total amount
  static const Color red = Color(0xFFF03351);
  static const Color secondary = Color(0xFF00B2AB);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF757575);
  static const Color background = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color black = Color(0xFF000000);
}

class AppSpacing {
  static const double padding = 24.0;
}

// Text Styles
class AppTextStyles {
  static final TextStyle appBarText = GoogleFonts.poppins(
    color: AppColors.textPrimary,
  );

  static final TextStyle title = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static final TextStyle bodyTitle = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static final TextStyle bodyTitle2 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static final TextStyle body = GoogleFonts.poppins(
    fontSize: 16,
    color: AppColors.textSecondary,
  );

  static final TextStyle bodySmall = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.grey,
  );

  static final TextStyle button = GoogleFonts.poppins(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
