import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/pages/home/home_page.dart';
import 'package:flutter_template/themes/buffalo-sabres-light-theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Placeholder Main Screen',
      theme: buffaloSabresLightTheme,
      home: HomePage(),
    );
  }
}
