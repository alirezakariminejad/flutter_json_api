import 'package:flutter/material.dart';
import 'package:flutter_json_dart/screens/home_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
  Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
