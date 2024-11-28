import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primaryBackground = Color(0xFFFEE5E5);
  static const Color secondaryBackground = Color(0xFFE0F7F7);
  static const Color primaryText = Color(0xFF333333);
  static const Color accentColor = Color(0xFF00C5A0);
  static const Color secondaryText = Color(0xFF666666);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color subtleBorder = Color(0xFFEEEEEE);

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: primaryBackground,
      primary: accentColor,
      secondary: secondaryText,
      onPrimary: Colors.white,
      onSecondary: primaryText,
      surface: cardBackground,
      onSurface: primaryText,
    ),

    // Text Theme
    textTheme: TextTheme(
      displayLarge: GoogleFonts.montserrat(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: primaryText,
        letterSpacing: -0.5,
      ),
      displayMedium: GoogleFonts.montserrat(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: primaryText,
      ),
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 16,
        color: primaryText,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14,
        color: secondaryText,
      ),
    ),

    // Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accentColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),

    // Card Theme
    cardTheme: CardTheme(
      color: cardBackground,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: subtleBorder,
          width: 1,
        ),
      ),
    ),

    // App Bar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: primaryBackground,
      elevation: 0,
      titleTextStyle: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: primaryText,
      ),
      iconTheme: const IconThemeData(
        color: primaryText,
      ),
    ),
  );
}
