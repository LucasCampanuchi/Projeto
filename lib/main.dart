import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto_teste/config/my_http.dart';

import 'config/my_app.dart';
import 'services/shared_preferences.service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  String? logged = await sharedPreferencesService.readData('logged');
  bool isLogged = logged == 'true';

  runApp(
    MyApp(
      isLogged: isLogged,
    ),
  );
}
