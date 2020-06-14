import 'package:flutter/material.dart';

final _colorScheme = ColorScheme(
  primary: Colors.indigo,
  primaryVariant: Colors.indigo,
  secondary: Colors.limeAccent,
  secondaryVariant: Colors.limeAccent,
  surface: Colors.white,
  background: Colors.white,
  error: Colors.red,
  onPrimary: Colors.white,
  onSecondary: Colors.grey[800],
  onSurface: Colors.grey[800],
  onBackground: Colors.grey[800],
  onError: Colors.white,
  brightness: Brightness.light,
);

final appTheme = ThemeData(
  colorScheme: _colorScheme,
  primaryColor: _colorScheme.primary,
  accentColor: _colorScheme.secondary,
  backgroundColor: _colorScheme.background,
  buttonTheme: ButtonThemeData(
    padding: EdgeInsets.all(16.0),
    buttonColor: _colorScheme.primary,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
  scaffoldBackgroundColor: _colorScheme.background,
  appBarTheme: AppBarTheme(
    elevation: 0.0,
  ),
  errorColor: _colorScheme.error,
  brightness: _colorScheme.brightness
);