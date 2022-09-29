import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_theme.dart';

/// Менеджер темы
class ThemeManager {
  const ThemeManager();

  static ThemeData light(AppTheme theme) {
    var caption = const TextTheme().caption;
    caption = caption?.copyWith(
      color: theme.textTheme.caption?.color,
    );
    return ThemeData(
      primaryColor: theme.colors.primaryColor,
      splashColor: theme.colors.splashColor,
      scaffoldBackgroundColor: theme.colors.scaffoldBackgroundColor,
      unselectedWidgetColor: theme.colors.accentColor,
      dividerColor: theme.colors.dividerColor,
      iconTheme: theme.dataTheme.iconTheme,
      inputDecorationTheme: theme.dataTheme.inputDecorationTheme,
      bottomNavigationBarTheme: theme.dataTheme.bottomNavigationBarTheme,
      elevatedButtonTheme: theme.dataTheme.elevatedButtonTheme,
      appBarTheme: theme.dataTheme.appBarTheme,
      tabBarTheme: theme.dataTheme.tabBarTheme,

      visualDensity: theme.dataTheme.visualDensity,
      dataTableTheme: theme.dataTheme.dataTableTheme,

      textTheme: const TextTheme().copyWith(
        headline1: theme.textTheme.headline1,
        headline2: theme.textTheme.headline2,
        headline3: theme.textTheme.headline3,
        headline4: theme.textTheme.headline4,
        headline5: theme.textTheme.headline5,
        bodyText1: theme.textTheme.bodyText1,
        bodyText2: theme.textTheme.bodyText2,
        subtitle1: theme.textTheme.subtitle1,
        subtitle2: theme.textTheme.subtitle2,
        caption: caption
      ),

      // cardColor: theme.colors.colorScheme?.onSecondary,

      cardTheme: theme.dataTheme.cardTheme,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: theme.colors.primaryColor,
        secondary: theme.colors.accentColor,
      ),
    );
  }

  static ThemeData dark(AppTheme theme) {
     var caption = const TextTheme().caption;
    caption = caption?.copyWith(
      color: theme.textTheme.caption?.color,
    );
    return ThemeData.dark().copyWith(
      primaryColor: theme.colors.primaryColor,
      splashColor: theme.colors.splashColor,
      scaffoldBackgroundColor: theme.colors.scaffoldBackgroundColor,
      unselectedWidgetColor: theme.colors.accentColor,
      dividerColor: theme.colors.dividerColor,

      inputDecorationTheme: theme.dataTheme.inputDecorationTheme,
      bottomNavigationBarTheme: theme.dataTheme.bottomNavigationBarTheme,
      elevatedButtonTheme: theme.dataTheme.elevatedButtonTheme,
      appBarTheme: theme.dataTheme.appBarTheme,
      tabBarTheme: theme.dataTheme.tabBarTheme,

      visualDensity: theme.dataTheme.visualDensity,
      dataTableTheme: theme.dataTheme.dataTableTheme,

      textTheme: const TextTheme().copyWith(
        headline1: theme.textTheme.headline1,
        headline2: theme.textTheme.headline2,
        headline3: theme.textTheme.headline3,
        headline4: theme.textTheme.headline4,
        headline5: theme.textTheme.headline5,
        bodyText1: theme.textTheme.bodyText1,
        bodyText2: theme.textTheme.bodyText2,
        subtitle1: theme.textTheme.subtitle1,
        subtitle2: theme.textTheme.subtitle2,
        caption: caption
      ),

      // cardColor: theme.colors.colorScheme?.onSecondary,

      cardTheme: theme.dataTheme.cardTheme,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: theme.colors.primaryColor,
        secondary: theme.colors.accentColor,
      ),
    
    );
  }

  static ThemeData createTheme(AppTheme theme, ThemeMode mode) {
    late ThemeData themeData;
    if (mode == ThemeMode.light) {
      themeData = light(theme);
      if (Platform.isIOS) {
        themeData = themeData.copyWith(
            appBarTheme: themeData.appBarTheme.copyWith(
                systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Color(0xff409582),
                    statusBarBrightness: Brightness.light,
                    statusBarIconBrightness: Brightness.light)));
      }
    } else {
      themeData = dark(theme);
      if (Platform.isIOS) {
        themeData = themeData.copyWith(
            appBarTheme: themeData.appBarTheme.copyWith(
                systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.dark,
                    statusBarIconBrightness: Brightness.dark)));
      }
    }

    return themeData;
  }
}
