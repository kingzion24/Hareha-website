import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Font Families
  static String get primaryFont => GoogleFonts.inter().fontFamily!;
  static String get monoFont => GoogleFonts.jetBrainsMono().fontFamily!;
  
  // Display Styles (Hero Sections)
  static TextStyle displayLarge(BuildContext context) {
    final responsive = MediaQuery.of(context).size.width;
    return GoogleFonts.inter(
      fontSize: responsive > 768 ? 56 : 32,
      height: responsive > 768 ? 1.14 : 1.25,
      fontWeight: FontWeight.w700,
      color: AppColors.darkNavy,
      letterSpacing: -0.5,
    );
  }
  
  static TextStyle displayMedium(BuildContext context) {
    final responsive = MediaQuery.of(context).size.width;
    return GoogleFonts.inter(
      fontSize: responsive > 768 ? 48 : 28,
      height: responsive > 768 ? 1.16 : 1.28,
      fontWeight: FontWeight.w700,
      color: AppColors.darkNavy,
      letterSpacing: -0.5,
    );
  }
  
  // Heading Styles
  static TextStyle h1(BuildContext context) {
    final responsive = MediaQuery.of(context).size.width;
    return GoogleFonts.inter(
      fontSize: responsive > 768 ? 48 : 28,
      height: responsive > 768 ? 1.16 : 1.28,
      fontWeight: FontWeight.w700,
      color: AppColors.darkNavy,
    );
  }
  
  static TextStyle h2(BuildContext context) {
    final responsive = MediaQuery.of(context).size.width;
    return GoogleFonts.inter(
      fontSize: responsive > 768 ? 36 : 24,
      height: responsive > 768 ? 1.22 : 1.33,
      fontWeight: FontWeight.w700,
      color: AppColors.darkNavy,
    );
  }
  
  static TextStyle h3(BuildContext context) {
    final responsive = MediaQuery.of(context).size.width;
    return GoogleFonts.inter(
      fontSize: responsive > 768 ? 28 : 20,
      height: responsive > 768 ? 1.28 : 1.4,
      fontWeight: FontWeight.w600,
      color: AppColors.darkNavy,
    );
  }
  
  static TextStyle h4(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 20,
      height: 1.4,
      fontWeight: FontWeight.w600,
      color: AppColors.darkNavy,
    );
  }
  static TextStyle titleLarge(BuildContext context) {
  return GoogleFonts.inter(
    fontSize: 22,
    height: 1.4,
    fontWeight: FontWeight.w600,
    color: AppColors.darkNavy,
  );
}

static TextStyle displaySmall(BuildContext context) {
  final responsive = MediaQuery.of(context).size.width;
  return GoogleFonts.inter(
    fontSize: responsive > 768 ? 40 : 24,
    height: responsive > 768 ? 1.2 : 1.3,
    fontWeight: FontWeight.w700,
    color: AppColors.darkNavy,
    letterSpacing: -0.5,
  );
}
  // Body Styles
  static TextStyle bodyLarge(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 18,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: AppColors.darkNavy,
    );
  }
  
  static TextStyle bodyMedium(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: AppColors.darkNavy,
    );
  }
  
  static TextStyle bodySmall(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 14,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: AppColors.textGray,
    );
  }
  
  // Special Styles
  static TextStyle buttonLarge(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
      letterSpacing: 0.3,
    );
  }
  
  static TextStyle buttonMedium(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 14,
      height: 1.5,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
      letterSpacing: 0.3,
    );
  }
  
  // Monospace for data
  static TextStyle monoData(BuildContext context) {
    return GoogleFonts.jetBrainsMono(
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w500,
      color: AppColors.cyan,
    );
  }
  
  // Link Style
  static TextStyle link(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w500,
      color: AppColors.cyan,
      decoration: TextDecoration.underline,
    );
  }
  
  // Caption
  static TextStyle caption(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 12,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: AppColors.textGray,
    );
  }
}