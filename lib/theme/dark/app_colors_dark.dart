import 'package:flutter/material.dart';

import '../elements/app_colors.dart';


///
class AppColorsDark implements AppColors {
  /// SYSTEM
  @override
  Color? appBarColor;

  @override
  Brightness? brightness = Brightness.dark;

  @override
  ColorScheme? colorScheme = const ColorScheme.dark();

  @override
  Color scaffoldBackgroundColor = const Color.fromARGB(255, 21, 24, 31);

  // @override
  // Color scaffoldBackgroundColor = Color.fromARGB(255, 19, 19, 19);

  @override
  Color? tabBarColor;

  @override
  Color? tabBarNormalColor;

  @override
  Color? tabBarSelectedColor = Colors.white;

  @override
  Color primaryColor = const Color.fromARGB(255, 13, 182, 145);

  @override
  Color accentColor = const Color(0xff777878);

  @override
  Color splashColor = const Color.fromARGB(255, 35, 45, 54);

  @override
  Color? dividerColor = const Color.fromARGB(66, 196, 196, 196);

  /// CUSTOM

  @override
  Color? cardColor = const Color.fromARGB(255, 29, 37, 44);
  // @override
  // Color? cardColor = Color.fromARGB(255, 48, 48, 48);

  @override
  Color? textColor = const Color.fromARGB(255, 236, 236, 236);

  @override
  Color? newTextColor = Colors.grey.shade500;
}
