import 'package:flutter/material.dart';
import 'screens/home_screen/home_screen.dart';
import 'utils/swing_processor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SwingProcessor swingProcessor = SwingProcessor();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golf Swing Inspector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(swingProcessor: swingProcessor),
    );
  }
}
