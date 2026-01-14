import 'package:flutter/material.dart';

class AppColors {
  // EXACT Walawe Colors - Dark Navy to Blue-Cyan Gradient
  static const Color darkNavy = Color(0xFF0A0E1A); // Very dark navy
  static const Color darkBlue = Color(0xFF0F1729); // Dark blue
  static const Color midBlue = Color(0xFF1E40AF); // Mid blue
  static const Color brightBlue = Color(0xFF3B82F6); // Bright blue
  static const Color cyan = Color(0xFF06B6D4); // Cyan
  static const Color lightCyan = Color(0xFF67E8F9); // Light cyan
  static const Color mediumGray = Color(0xFF9CA3AF);
  // Accent Colors
  static const Color accentOrange = Color(0xFFFF6B35);
  static const Color accentPurple = Color(0xFF8B5CF6);
  static const Color accentGreen = Color(0xFF10B981);
  static const Color accentPink = Color(0xFFEC4899);
  
  // Text & Background
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFFAFAFA);
  static const Color lightGray = Color(0xFFF5F5F5);
  static const Color textGray = Color(0xFF64748B);
  static const Color darkGray = Color(0xFF334155);
  
  // Status
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  
  // Gradients - EXACT Walawe Style
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0A0E1A), // Dark navy
      Color(0xFF1E3A8A), // Deep blue
      Color(0xFF2563EB), // Blue
      Color(0xFF3B82F6), // Bright blue
      Color(0xFF06B6D4), // Cyan
    ],
    stops: [0.0, 0.25, 0.5, 0.75, 1.0],
  );
  
  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF06B6D4), // Cyan
      Color(0xFF3B82F6), // Blue
    ],
  );
  
  static const LinearGradient footerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF0A0E1A),
      Color(0xFF1E3A8A),
    ],
  );
  
  // Card backgrounds
  static const Color cardLight = Color(0xFFFAFAFA);
  static const Color cardDark = Color(0xFF1E293B);
  
  // Glow effects
  static BoxShadow cyanGlow = BoxShadow(
    color: const Color(0xFF06B6D4).withOpacity(0.4),
    blurRadius: 40,
    spreadRadius: 10,
  );
  
  static BoxShadow blueGlow = BoxShadow(
    color: const Color(0xFF3B82F6).withOpacity(0.3),
    blurRadius: 30,
    spreadRadius: 5,
  );
}