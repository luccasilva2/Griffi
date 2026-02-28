import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Cores
  static const Color background = Color(0xFF121212);
  static const Color surface = Color(0xFF1E1E1E);
  static const Color surfaceVariant = Color(0xFF2C2C2C);
  static const Color accent = Color(0xFFF57C00); // Laranja Vibrante
  static const Color accentDim = Color(0xFFBF360C);
  static const Color onSurface = Color(0xFFFFFFFF);
  static const Color onSurfaceDim = Color(0xFFB0B0B0);
  static const Color divider = Color(0xFF333333);

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.dark(
        primary: accent,
        onPrimary: Color(0xFF1A1A1A),
        secondary: accentDim,
        surface: surface,
        onSurface: onSurface,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.playfairDisplay(
          color: onSurface,
          fontSize: 22,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
        iconTheme: const IconThemeData(color: onSurface),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: surface,
        selectedItemColor: accent,
        unselectedItemColor: onSurfaceDim,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: surfaceVariant,
        selectedColor: accent,
        labelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        secondaryLabelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: background,
        ),
        side: BorderSide.none,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.playfairDisplay(color: onSurface),
        displayMedium: GoogleFonts.playfairDisplay(color: onSurface),
        headlineLarge: GoogleFonts.playfairDisplay(
          color: onSurface,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: GoogleFonts.playfairDisplay(
          color: onSurface,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: GoogleFonts.inter(
          color: onSurface,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: GoogleFonts.inter(
          color: onSurface,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: GoogleFonts.inter(color: onSurface, fontSize: 16),
        bodyMedium: GoogleFonts.inter(color: onSurfaceDim, fontSize: 14),
        labelLarge: GoogleFonts.inter(
          color: accent,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
