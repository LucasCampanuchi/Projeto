import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: /* rgb(0 142 187) */ const Color.fromRGBO(
      0,
      142,
      187,
      1,
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color.fromRGBO(0, 142, 187, 1),
    titleTextStyle: GoogleFonts.openSans(
      color: Colors.white,
      fontSize: 20,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: GoogleFonts.openSans(
      fontSize: 14,
    ),
    filled: true,
    fillColor: Colors.white, // Background color
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFFD5D5D5), // Border color
        width: 1.0,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFFD5D5D5), // Border color when focused
        width: 1.0,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
  ),
  useMaterial3: true,
);
