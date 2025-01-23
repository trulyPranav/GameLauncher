import 'package:flutter/material.dart';
import 'package:game_launcher/Screens/MainScreen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Game Launcher Excel 2024",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}