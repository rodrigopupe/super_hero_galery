import 'package:flutter/material.dart';

const _HEADER_FONT_FAMILY = 'PtSansNarrow';
const _BODY_FONT_FAMILY = 'Nunito';

final textTheme = TextTheme(
  headline1: TextStyle(
      fontFamily: _HEADER_FONT_FAMILY,
      fontSize: 42,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5),
  headline2: TextStyle(
      fontFamily: _HEADER_FONT_FAMILY,
      fontSize: 36,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5),
  headline3: TextStyle(fontFamily: _HEADER_FONT_FAMILY, fontSize: 32, fontWeight: FontWeight.w400),
  headline4: TextStyle(
      fontFamily: _HEADER_FONT_FAMILY,
      fontSize: 28,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25),
  headline5: TextStyle(fontFamily: _HEADER_FONT_FAMILY, fontSize: 24, fontWeight: FontWeight.w400),
  headline6: TextStyle(
      fontFamily: _HEADER_FONT_FAMILY,
      fontSize: 21,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15),
  subtitle1: TextStyle(
      fontFamily: _HEADER_FONT_FAMILY,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15),
  subtitle2: TextStyle(
      fontFamily: _HEADER_FONT_FAMILY,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1),
  bodyText1: TextStyle(
      fontFamily: _BODY_FONT_FAMILY, fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: TextStyle(
      fontFamily: _BODY_FONT_FAMILY,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25),
  button: TextStyle(
      fontFamily: _BODY_FONT_FAMILY,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25),
  caption: TextStyle(
      fontFamily: _BODY_FONT_FAMILY, fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: TextStyle(
      fontFamily: _BODY_FONT_FAMILY, fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

final _colorScheme = ColorScheme(
  primary: Colors.indigo,
  primaryVariant: Colors.indigo,
  secondary: Colors.limeAccent,
  secondaryVariant: Colors.limeAccent,
  surface: Colors.grey[50],
  background: Colors.grey[50],
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
    textTheme: textTheme,
    buttonTheme: ButtonThemeData(
      padding: EdgeInsets.all(16.0),
      buttonColor: _colorScheme.primary,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    scaffoldBackgroundColor: _colorScheme.background,
    errorColor: _colorScheme.error,
    brightness: _colorScheme.brightness);
