import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF00D4FF);
  static const Color secondary = Color(0xFF006BFF);
  static const Color tertiary = Color(0xFF00FF8B);

  static const Color background = Color(0xFF0A0A1A);
  static const Color surface = Color(0xFF121223);
  static const Color surface2 = Color(0xFF1A1B35);

  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB8B8D2);
  static const Color textMuted = Color(0xFF7C7D9A);

  static const Color border = Color(0xFF2A2C4A);
  static const Color error = Color(0xFFFF5F5F);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [secondary, primary],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient greenAccentGradient = LinearGradient(
    colors: [tertiary, primary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}