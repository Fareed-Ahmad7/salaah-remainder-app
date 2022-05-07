import 'package:flutter/material.dart';
import 'package:salaah_remainder/widgets/Glassmorphism.dart';

import 'widgets/Salaah_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: const Color.fromRGBO(6, 125, 131, 1),
          title: const Text('salaah remainder'),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/morocco.jpg.webp",
              ),
            ),
            Flexible(
             flex: 1,
             fit: FlexFit.tight,
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                decoration: const BoxDecoration(color: Color.fromRGBO(6, 125, 131, 1)),
                child: const Salaah()),
            )
          ],
        ),
      ),
    );
  }
}