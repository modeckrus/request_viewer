import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../elements/app_colors.dart';
import '../elements/app_data_theme.dart';

///
class AppDataThemeDarkImpl implements AppDataTheme {
  AppDataThemeDarkImpl(this.appColors) {
    cardTheme = CardTheme(
      color: appColors.cardColor,
      elevation: 0.0,
      margin: EdgeInsets.zero,
    );

    tabBarTheme = const TabBarTheme(
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 11, 211, 168),
          ),
        ),
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      labelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      labelColor: Color.fromARGB(255, 11, 211, 168),
      unselectedLabelColor: Color.fromARGB(66, 199, 199, 199),
    );

    bottomNavigationBarTheme = BottomNavigationBarThemeData(
      backgroundColor: appColors.cardColor,
      selectedIconTheme: const IconThemeData(
        color: Color.fromARGB(255, 11, 211, 168),
        size: 24,
      ),
      unselectedIconTheme: IconThemeData(
        color: appColors.accentColor,
        size: 24,
      ),
      selectedItemColor: const Color.fromARGB(255, 11, 211, 168),
      selectedLabelStyle: TextStyle(
        color: appColors.primaryColor,
        fontSize: 12,
      ),
      unselectedItemColor: appColors.accentColor,
      unselectedLabelStyle: TextStyle(
        color: appColors.accentColor,
        fontSize: 12,
      ),
      showUnselectedLabels: true,
    );

    elevatedButtonTheme = ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return const Color.fromARGB(169, 76, 112, 107);
            }

            return const Color.fromARGB(255, 38, 94, 89);
          },
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 30,
          ),
        ),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder()),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  final AppColors appColors;

  @override
  InputDecorationTheme? inputDecorationTheme = const InputDecorationTheme(
    labelStyle: TextStyle(
      fontSize: 18,
      height: 0,
    ),
  );

  @override
  VisualDensity? visualDensity = const VisualDensity(
    horizontal: VisualDensity.minimumDensity,
    vertical: VisualDensity.minimumDensity,
  );

  @override
  late CardTheme? cardTheme;

  @override
  DataTableThemeData? dataTableTheme = const DataTableThemeData(
    columnSpacing: 20,
    horizontalMargin: 20,
  );

  @override
  TabBarTheme? tabBarTheme;

  @override
  late BottomNavigationBarThemeData? bottomNavigationBarTheme;

  @override
  late ElevatedButtonThemeData? elevatedButtonTheme;

  @override
  AppBarTheme? appBarTheme = const AppBarTheme(
    brightness: Brightness.dark,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 23, 29, 34),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
    backgroundColor: Color.fromARGB(255, 23, 29, 34),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
    textTheme: TextTheme(
      headline3: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      headline4: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headline5: TextStyle(
        fontSize: 12,
        color: Colors.white70,
      ),
    ),
  );

  @override
  IconThemeData? iconTheme = const IconThemeData(color: Colors.white);
}
