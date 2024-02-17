import 'package:flutter/material.dart';
import 'package:menu/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
        ),
      ),
      title: 'Calculadora de IMC',
      home: HomePage(),
    );
  }
}
