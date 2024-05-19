import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projeto_teste/themes/app_theme.dart';

import '../pages/home_page/view/home_page.dart';
import '../pages/login_page/view/login_page.dart';

class MyApp extends StatelessWidget {
  final bool isLogged;
  const MyApp({
    super.key,
    required this.isLogged,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      initialRoute: isLogged ? '/home' : '/',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
