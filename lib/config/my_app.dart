import 'package:flutter/material.dart';
import 'package:projeto_teste/themes/app_theme.dart';

import '../pages/home_page/view/home_page.dart';
import '../pages/login_page/view/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
