// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/pages/home_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellow, // AppBar background color
          foregroundColor: Colors.black, // AppBar text/icon color
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.yellow, // FAB background color
          foregroundColor: Colors.black, // FAB text/icon color
        ),
        scaffoldBackgroundColor: Colors.yellow[200], // Background color
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.yellow, // Set button primary color
          ),
        ),
        primarySwatch: Colors.yellow, // Use yellow as the primary color
      ),
    );
  }
}
