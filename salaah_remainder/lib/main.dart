import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'widgets/Salaah_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
              flex: 1, // using flex widget to size container rest of screen
              fit: FlexFit.tight,
              child: Container(
                  padding: const EdgeInsets.fromLTRB(40, 30, 40, 20),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(6, 125, 131, 1)),
                  child: Salaah()),
            )
          ],
        ),
      ),
    );
  }
}
