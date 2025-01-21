import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background: Colors.white,
        onBackground: Colors.black,
        secondary: Color(0xFF5E35B1)));
ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: Colors.grey[900],
        onBackground: Colors.white,
        secondary: Color(0xFFB39BBD)));
