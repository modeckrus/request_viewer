import 'package:flutter/material.dart';
import 'package:request_viewer/server/server.dart';
import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'app.dart';

void main() async {
  MainServer.serve();
  await runZonedGuarded(
    () async {
      HydratedBloc.storage = await _createStorage();
      runApp(const MyApp());
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

String joinPath(String p1, String p2) {
  if (Platform.isWindows) {
    return '$p1\\$p2';
  } else {
    return '$p1/$p2';
  }
}

HydratedStorage? storage;
bool initialized = false;

FutureOr<Storage> _createStorage() async {
  if (storage != null) return storage!;
  if (kIsWeb) {
    storage = await HydratedStorage.build(
        storageDirectory: HydratedStorage.webStorageDirectory);
    return storage!;
  }
  WidgetsFlutterBinding.ensureInitialized();
  Directory? storageDirectory;
  try {
    storageDirectory = await getApplicationDocumentsDirectory();
  } catch (e) {
    log('Error getting application documents directory: $e');
  }
  storageDirectory ??=
      Directory(joinPath(Directory.systemTemp.path, 'flutter_bloc'));
  storage = await HydratedStorage.build(storageDirectory: storageDirectory);
  return storage!;
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
