import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'repositories/swing_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SwingRepository swingRepository = SwingRepository();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golf Swing Inspector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(swingRepository: swingRepository),
    );
  }
}
