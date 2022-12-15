import 'package:flutter/material.dart';
import 'package:request_viewer/server/server.dart';
import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'app.dart';

void main() async {
  MainServer.serve();
  runZonedGuarded(
    () => runApp(const MyApp()),
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
    },
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
