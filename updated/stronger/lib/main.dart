import 'package:flutter/material.dart';
import "home.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stronger',
      theme: ThemeData(
        // This is the theme of the application.
        primarySwatch: Colors.blue,
        // dark mode
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: const Home(),
    );
  }
}
