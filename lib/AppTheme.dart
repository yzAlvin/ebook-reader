import 'package:flutter/material.dart';

ThemeData AppTheme() => ThemeData(
    brightness: Brightness.dark,
    cardColor: Colors.blue,
    // backgroundColor: Colors.black12,
    textTheme: const TextTheme(
      subtitle1: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
      bodyText1: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(fontSize: 12),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black12,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.orangeAccent[200],
      backgroundColor: Colors.black38,
    ),
    expansionTileTheme: const ExpansionTileThemeData(
        textColor: Colors.white, iconColor: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.orange))));
