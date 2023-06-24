import 'package:flutter/material.dart';
import 'package:fluttertv/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TV',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartPage(title: 'Flutter TV'),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:  Home(),
    );
  }
}
