import 'package:flutter/material.dart';

class Themes {
  static const _colorPrimary = Color.fromARGB(255, 239, 198, 0);
  static const _colorPrimaryVariant = Color.fromARGB(255, 255, 241, 113);
  static const _colorSecondary = Color.fromARGB(255, 6, 65, 106);
  static const _colorError = Colors.red;
  static ThemeData themeDefault = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: _colorPrimary,
      foregroundColor: _colorSecondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: _colorPrimaryVariant,
        foregroundColor: _colorSecondary,
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: _colorSecondary, width: 2),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: _colorPrimary, width: 2),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: _colorError, width: 2),
      ),
      contentPadding: EdgeInsets.all(8),
    ),
    cardTheme: CardTheme(
      color: _colorPrimaryVariant,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 8,
      margin: const EdgeInsets.all(8),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: _colorSecondary,
          overflow: TextOverflow.fade),
    ),
    useMaterial3: true,
  );
}
