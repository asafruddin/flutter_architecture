import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTheme {
  /// Global Color
  static const Color primary = Color(0xFF13B9FF);

  /// light color
  static const Color lightBackground = Color(0xFFF2F4F5);

  /// dark color
  static const Color darkBackground = Color(0xFF030405);

  /// text theme
  static final textTheme = TextTheme(
      headline1: GoogleFonts.inter(
          fontSize: 93, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      headline2: GoogleFonts.inter(
          fontSize: 58, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      headline3: GoogleFonts.inter(fontSize: 47, fontWeight: FontWeight.w400),
      headline4: GoogleFonts.inter(
          fontSize: 33, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headline5: GoogleFonts.inter(fontSize: 23, fontWeight: FontWeight.w400),
      headline6: GoogleFonts.inter(
          fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      subtitle1: GoogleFonts.inter(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      subtitle2: GoogleFonts.inter(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyText1: GoogleFonts.inter(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyText2: GoogleFonts.inter(
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: GoogleFonts.inter(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      caption: GoogleFonts.inter(
          fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      overline: GoogleFonts.inter(
          fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5));

  /// Light Theme Data
  static final lightTheme = ThemeData(
      primaryColor: primary,
      scaffoldBackgroundColor: lightBackground,
      textTheme: textTheme);

  /// Dark Theme Data
  static final darkTheme = ThemeData(
      primaryColor: primary,
      scaffoldBackgroundColor: darkBackground,
      textTheme: textTheme);
}
