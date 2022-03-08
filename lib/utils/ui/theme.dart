import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTheme {
  /// Global Color
  static const Color primary = Color(0xFF7E16A7);
  static const Color primaryVariant = Color(0xFF4B0C93);
  static const Color secondary = Color(0xFFFCC21B);
  static const Color secondaryVariant = Color(0xFFFCC2AF);
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFF8E8E93);
  static const Color error = Color(0xFFDC3545);
  static const Color onPrimary = pureWhite;
  static const Color onError = pureWhite;

  /// light color
  static const Color lightBackground = Color(0xFFF2F4F5);
  static const Color surface = pureWhite;
  static const Color onLightBackground = Color(0xFF1F1F1F);
  static const Color onLightSurface = onLightBackground;

  /// dark color
  static const Color darkBackground = Color(0xFF0E0F15);
  static const Color darkSurface = Color(0xFF000000);
  static const Color onDarkBacground = pureWhite;
  static const Color onDarkSurface = pureWhite;

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

  /// color scheme light
  static const lightColorScheme = ColorScheme(
      primary: primary,
      secondary: secondary,
      surface: lightSurface,
      background: lightBackground,
      error: Colors.red,
      onPrimary: lightBackground,
      onSecondary: lightBackground,
      onSurface: onLightSurface,
      onBackground: onLightBackground,
      onError: onError,
      brightness: Brightness.light);

  /// color scheme dark
  static const darkColorScheme = ColorScheme(
      primary: primary,
      secondary: secondary,
      surface: darkSurface,
      background: darkBackground,
      error: Colors.red,
      onPrimary: pureWhite,
      onSecondary: pureWhite,
      onSurface: onDarkSurface,
      onBackground: onDarkBacground,
      onError: onError,
      brightness: Brightness.dark);

  /// floating action button theme
  static const floatingActionButtonTheme =
      FloatingActionButtonThemeData(backgroundColor: primary);

  /// light dialog theme
  static final lightDialogTheme = DialogTheme(
      backgroundColor: lightSurface,
      titleTextStyle: textTheme.headline5,
      contentTextStyle: textTheme.bodyText2);

  /// dark dialog theme
  static final darkDialogTheme = DialogTheme(
      backgroundColor: surface,
      titleTextStyle: textTheme.headline5,
      contentTextStyle: textTheme.bodyText2);

  /// radio theme
  static final radioTheme = RadioThemeData(
      fillColor: MaterialStateProperty.all(primary),
      overlayColor: MaterialStateProperty.all(primary.withOpacity(0.1)));

  /// app bar theme data
  static const appBarTheme = AppBarTheme(backgroundColor: primary);

  /// Light Theme Data
  static final lightTheme = ThemeData(
      primaryColor: primary,
      scaffoldBackgroundColor: lightBackground,
      colorScheme: lightColorScheme,
      floatingActionButtonTheme: floatingActionButtonTheme,
      radioTheme: radioTheme,
      appBarTheme: appBarTheme,
      textTheme: textTheme);

  /// Dark Theme Data
  static final darkTheme = ThemeData(
      primaryColor: primary,
      appBarTheme: appBarTheme,
      scaffoldBackgroundColor: darkBackground,
      floatingActionButtonTheme: floatingActionButtonTheme,
      colorScheme: darkColorScheme,
      dialogTheme: darkDialogTheme,
      radioTheme: radioTheme,
      textTheme: textTheme);
}
