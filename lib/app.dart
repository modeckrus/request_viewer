import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:request_viewer/theme/theme.dart';
import 'package:request_viewer/theme/theme_manager.dart';
import 'navigator/app_routes.dart';
import 'theme/dark/app_theme_dark.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = MyThemeData.dark();
    return MyTheme(
      data: theme,
      child: MaterialApp(
        title: 'Request Viewer',
        scrollBehavior: MyCustomScrollBehavior(),
        darkTheme:
            ThemeManager.createTheme(const AppThemeDark(), ThemeMode.dark),
        themeMode: ThemeMode.dark,
        initialRoute: '/',
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}

