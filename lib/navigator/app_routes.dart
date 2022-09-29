import 'package:flutter/material.dart';
import 'package:proto/proto.dart';
import 'package:request_viewer/pages/home/home_page.dart';
import 'package:request_viewer/pages/not_found_page.dart';
import 'package:request_viewer/pages/request/request_page.dart';

class AppRoutes {
  static const String home = '/', requestPage = '/request_page';
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    Widget Function(BuildContext) builder;
    switch (settings.name) {
      case home:
        builder = (_) => const HomePage();
        break;
      case requestPage:
        if (args is RequestModel) {
          builder = (_) => RequestPage(
                model: args,
              );
        } else {
          builder = (_) => NotFoundPage();
        }
        break;
      default:
        builder = (_) => NotFoundPage();
    }
    return MaterialPageRoute(builder: builder);
  }
}
