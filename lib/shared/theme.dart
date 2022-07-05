import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF2E2F38),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF4E505F),
    onSecondary: Color(0xFFFFFFFF),
    tertiary: Color(0xFF4B5EFC),
    onTertiary: Color(0xFFFFFFFF),
    background: Color(0xFF17171C),
    onBackground: Color(0xFFFFFFFF),
    error: Color(0xFFFFFFFF),
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFFFFFFFF),
  ),
  fontFamily: 'WorkSans',
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 34,
    ),
    headline1: TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 96,
    ),
    headline2: TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 40,
    ),
  ),
);

ThemeData light = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFFFFFF),
    onPrimary: Color(0xFF000000),
    secondary: Color(0xFFD2D3DA),
    onSecondary: Color(0xFF000000),
    tertiary: Color(0xFF4B5EFC),
    onTertiary: Color(0xFFFFFFFF),
    background: Color(0xFFF1F2F3),
    onBackground: Color(0xFFFFFFFF),
    error: Color(0xFFFFFFFF),
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFFFFFFFF),
  ),
  fontFamily: 'WorkSans',
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Color(0xFF000000),
      fontSize: 32,
    ),
    headline1: TextStyle(
      color: Color(0xFF000000),
      fontSize: 96,
    ),
    headline2: TextStyle(
      color: Color(0xFF000000),
      fontSize: 40,
    ),
  ),
);
