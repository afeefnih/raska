import 'package:flutter/material.dart';

class AppTheme {
  // Define light theme colors
  static const Color primaryColor = Color(0xFFF49609);
  static const Color secondaryColor = Color(0xFFFFFEF0);

  // Define dark theme colors
  static const Color primaryColorDark = Color(0xFFF49609);
  static const Color secondaryColorDark = Color(0xFFFFFEF0);

  // Light Theme Data
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: primaryColor,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  // Dark Theme Data
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColorDark,
    colorScheme: ColorScheme.dark(
      primary: primaryColorDark,
      secondary: secondaryColorDark,
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: primaryColorDark,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColorDark,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColorDark,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
