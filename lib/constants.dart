import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFFCB7C4C);
  static const Color background = Color(0xFF121212);
  static const Color cardBackground = Color(0xFF1E1E1E);
  static const Color secondaryText = Colors.grey;
  static const Color white = Colors.white;
}

class AppStyles {
  static TextStyle heading = GoogleFonts.bebasNeue(
    fontSize: 45,
    color: AppColors.white,
  );

  static TextStyle subHeading = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static TextStyle body = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.secondaryText,
  );

  static TextStyle price = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
}
