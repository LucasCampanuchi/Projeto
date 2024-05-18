import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto_teste/config/my_http.dart';

import 'config/my_app.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(
    const MyApp(),
  );
}
