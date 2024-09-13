import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFfffdfc),
    appBarTheme: AppBarTheme(
      surfaceTintColor: const Color(0xFFfffdfc),
      backgroundColor: const Color(0xFFfffdfc),
      titleTextStyle: GoogleFonts.nunito(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF919eab),
      ),
      actionsIconTheme: const IconThemeData(color: Color(0xFF919eab)),
    ),
    primaryColor: const Color(0xFFff8702),
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFff8702)),
    disabledColor: const Color(0xFFe1ddd8),
    hintColor: const Color(0xFF919eab),
    shadowColor: const Color(0xFFB6A1C0).withOpacity(0.11),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.nunito(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF4c4c69),
      ),
      bodyMedium: GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: const Color(0xFF4c4c69),
      ),
      bodySmall: GoogleFonts.nunito(
        fontSize: 13,
        color: const Color(0xFF4c4c69),
      ),
      titleLarge: GoogleFonts.nunito(),
      titleMedium: GoogleFonts.nunito(),
      titleSmall: GoogleFonts.nunito(),
    ),
  );
}
