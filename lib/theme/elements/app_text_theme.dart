import 'package:flutter/material.dart';

/// Тема текста
abstract class AppTextTheme {
  AppTextTheme();

  TextStyle? headline1;

  TextStyle? headline2;

  TextStyle? headline3;

  TextStyle? headline4;

  TextStyle? headline5;

  TextStyle? subtitle1;

  TextStyle? subtitle2;

  TextStyle? bodyText1;

  TextStyle? bodyText2;

  String? fontFamily;
  TextStyle? caption;
}
