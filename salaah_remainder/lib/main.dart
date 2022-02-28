import 'package:flutter/material.dart';

import 'widgets/Salaah_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('salaah remainder'),
        ),
        body: const Salaah(),
      ),
    );
  }
}