// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

import '../utils/utils.dart';

class AppTheme {
  ///LIGHT MODE
  ///

  static const Color _scaffoldColorLight = Color(0xfff5f5f5);

  static const Color _primaryColorLight = Color(0xff5b2263);
  static const Color _buttonColor = Color(0xfff6596e);

  static const Color _secondaryColorLight = Color(0xfff5ded3);

  static const Color _errorColorLight = Color(0xffb00020);

  ///DARK MODE
  ///
  static const Color _scaffoldColorDark = Color(0xff121212);

  static const Color _primaryColorDark = Color(0xffb7b7a4);
  static const Color _secondaryColorDark = Color(0xffffe8d6);

  static const Color _errorColorDark = Color(0xffcf6679);

  static ThemeData light() {
    return ThemeData.light().copyWith(
      primaryColor: _primaryColorLight,
      primaryColorDark: _buttonColor,
      primaryColorLight: _primaryColorLight,
      errorColor: _errorColorLight,
      scaffoldBackgroundColor: _scaffoldColorLight,
      disabledColor: Colors.white.withOpacity(0.15),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.white,
      ),
      colorScheme: const ColorScheme.light().copyWith(
        primary: _primaryColorLight,
        primaryVariant: _primaryColorLight,
        secondary: _secondaryColorLight,
        secondaryVariant: _scaffoldColorLight,
        error: _errorColorLight,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontFamily: 'Outfit',
          fontSize: rf(32),
          fontWeight: FontWeight.w900,
          letterSpacing: -1.5,
          color: Colors.black,
        ),
        headline2: TextStyle(
          fontFamily: 'Outfit',
          fontSize: rf(28),
          fontWeight: FontWeight.w800,
          letterSpacing: -1.0,
          color: Colors.black,
        ),
        headline3: TextStyle(
          fontFamily: 'Outfit',
          fontSize: rf(24),
          fontWeight: FontWeight.w800,
          letterSpacing: -0.75,
          color: Colors.black,
        ),
        headline4: TextStyle(
          fontFamily: 'Outfit',
          fontSize: rf(20),
          fontWeight: FontWeight.w800,
          letterSpacing: -0.50,
          color: Colors.black,
        ),
        headline5: TextStyle(
          fontFamily: 'Outfit',
          fontSize: rf(18),
          fontWeight: FontWeight.w800,
          letterSpacing: -0.5,
          color: Colors.black,
        ),

        headline6: TextStyle(
          fontFamily: 'Outfit',
          fontSize: rf(16),
          fontWeight: FontWeight.w700,
          letterSpacing: -0.25,
          color: Colors.black,
        ),
        subtitle1: TextStyle(
          fontFamily: 'Outfit',
          fontSize: rf(16),
          letterSpacing: 0.15,
          color: Colors.black,
        ),
        subtitle2: TextStyle(
          fontFamily: 'Outfit',
          fontSize: rf(14),
          letterSpacing: 0.1,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        caption: TextStyle(
          fontFamily: 'Outfit',
          fontSize: rf(12),
          color: Colors.black,
        ),
        bodyText1: TextStyle(
          fontFamily: 'Outfit',
          fontSize: rf(16),
          letterSpacing: 0.5,
          color: Colors.black,
        ),
        bodyText2: TextStyle(
          fontFamily: 'Outfit',
          fontSize: rf(14),
          letterSpacing: 0.25,
          color: Colors.black,
        ),

        //BUTTON
        button: TextStyle(
          fontFamily: 'Outfit',
          fontSize: rf(11),
          letterSpacing: 1.25,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      primaryColor: _primaryColorDark,
      primaryColorDark: _primaryColorDark,
      primaryColorLight: _secondaryColorDark,
      errorColor: _errorColorDark,
      scaffoldBackgroundColor: _scaffoldColorDark,
      disabledColor: Colors.white.withOpacity(0.15),
      splashColor: Colors.white.withOpacity(0.50),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.white,
      ),
      colorScheme: const ColorScheme.dark().copyWith(
        primary: _primaryColorDark,
        primaryVariant: _primaryColorDark,
        secondary: _secondaryColorDark,
        secondaryVariant: _secondaryColorDark,
        error: _errorColorDark,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: rf(32),
          fontWeight: FontWeight.w900,
          letterSpacing: -1.5,
        ),
        headline2: TextStyle(
          fontSize: rf(28),
          fontWeight: FontWeight.w800,
          letterSpacing: -1.0,
        ),
        headline3: TextStyle(
          fontSize: rf(24),
          fontWeight: FontWeight.w800,
          letterSpacing: -0.75,
        ),
        headline4: TextStyle(
          fontSize: rf(20),
          fontWeight: FontWeight.w800,
          letterSpacing: -0.50,
        ),
        headline5: TextStyle(
          fontSize: rf(18),
          fontWeight: FontWeight.w800,
          letterSpacing: -0.5,
        ),

        headline6: TextStyle(
          fontSize: rf(16),
          fontWeight: FontWeight.w700,
          letterSpacing: -0.25,
        ),
        subtitle1: TextStyle(
          fontSize: rf(16),
          letterSpacing: 0.15,
        ),
        subtitle2: TextStyle(
          fontSize: rf(14),
          letterSpacing: 0.1,
          fontWeight: FontWeight.w600,
        ),
        caption: TextStyle(
          fontSize: rf(12),
        ),
        bodyText1: TextStyle(
          fontSize: rf(16),
          letterSpacing: 0.5,
        ),
        bodyText2: TextStyle(
          fontSize: rf(14),
          letterSpacing: 0.25,
        ),

        //BUTTON
        button: TextStyle(
          fontSize: rf(11),
          letterSpacing: 1.25,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
    );
  }
}
