import 'package:flutter/material.dart';

class CustomThemeData {
  ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    appBarTheme:const AppBarTheme(
      backgroundColor: Colors.yellow,
    ),
  );

  ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueGrey[900],
    ),
  );
}
