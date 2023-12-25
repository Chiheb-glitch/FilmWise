import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background: Color.fromARGB(255, 246, 238, 227), primary: Colors.black));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: Color.fromARGB(255, 30, 30, 30),
        primary: const Color.fromARGB(255, 246, 238, 227)));
