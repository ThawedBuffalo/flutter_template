import 'package:flutter/material.dart';

ThemeData buffaloSabresLightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
    ).copyWith(
      primary: Colors.green,
    ));
