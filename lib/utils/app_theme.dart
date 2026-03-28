import 'package:flutter/material.dart';

class AppTheme {
  // Warm, earthy palette — clay, turmeric, sage, cream
  static const Color warmBg    = Color(0xFFF5EDD8);
  static const Color paper     = Color(0xFFFDF9F2);
  static const Color cream     = Color(0xFFFAF6EF);
  static const Color clay      = Color(0xFFC4714A);
  static const Color clayDark  = Color(0xFF8B4A2A);
  static const Color clayLight = Color(0xFFE8956D);
  static const Color turmeric  = Color(0xFFC8870A);
  static const Color turmericLt= Color(0xFFF0B429);
  static const Color sage      = Color(0xFF4E7250);
  static const Color sageLt    = Color(0xFF6E9A70);
  static const Color rose      = Color(0xFFA84840);
  static const Color roseLt    = Color(0xFFC86860);
  static const Color ink       = Color(0xFF2C1A0E);
  static const Color inkMid    = Color(0xFF5C3D1E);
  static const Color inkSoft   = Color(0xFF8B6347);
  static const Color inkMuted  = Color(0xFFB8956A);
  static const Color border    = Color(0xFFDDD0B4);
  static const Color shadow    = Color(0x17000000);

  static ThemeData get theme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: warmBg,
    colorScheme: const ColorScheme.light(
      primary: clay,
      secondary: sage,
      surface: paper,
      error: rose,
    ),
    fontFamily: 'Mukta',
    appBarTheme: const AppBarTheme(
      backgroundColor: paper,
      elevation: 0,
      iconTheme: IconThemeData(color: ink),
      titleTextStyle: TextStyle(
        fontFamily: 'Mukta', color: ink,
        fontSize: 18, fontWeight: FontWeight.w700,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: clay,
        foregroundColor: Colors.white,
        elevation: 3,
        shadowColor: clay.withOpacity(0.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        textStyle: const TextStyle(fontFamily: 'Mukta', fontSize: 16, fontWeight: FontWeight.w700),
      ),
    ),
    cardTheme: CardThemeData(
      color: paper,
      elevation: 2,
      shadowColor: shadow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: border, width: 1),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: cream,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: clay, width: 1.5),
      ),
      labelStyle: const TextStyle(color: inkSoft, fontSize: 13),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    ),
  );

  // Text styles
  static TextStyle display(double size, {Color? color, FontWeight weight = FontWeight.w700}) =>
      TextStyle(fontFamily: 'Mukta', fontSize: size, fontWeight: weight, color: color ?? ink);

  static TextStyle body(double size, {Color? color, FontWeight weight = FontWeight.w400}) =>
      TextStyle(fontFamily: 'Mukta', fontSize: size, fontWeight: weight, color: color ?? ink, height: 1.55);
}
