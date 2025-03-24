import 'package:flutter/material.dart';
class AppTheme{
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
    primaryColor: const Color.fromRGBO(16, 117, 105, 1),
    fontFamily: 'NotoSans',
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: Colors.black, fontSize: 20),
      titleSmall: TextStyle(color: Colors.black, fontSize: 16),
      displayLarge: TextStyle(color: Colors.black, fontSize: 26),
      displayMedium: TextStyle(color: Colors.black, fontSize: 20),
      displaySmall: TextStyle(color: Colors.black, fontSize: 16),
      bodySmall: TextStyle(color: Colors.black, fontSize: 16),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      minimumSize: const Size.fromHeight(60),
      backgroundColor: const Color.fromRGBO(90, 240, 214, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    )),
  );
}