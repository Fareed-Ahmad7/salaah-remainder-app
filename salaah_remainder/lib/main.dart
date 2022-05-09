import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'widgets/salaah_widget.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

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
  late FlutterLocalNotificationsPlugin fltrNotification;
  @override
  void initState() {
    super.initState();
    var androidInitialize = new AndroidInitializationSettings('ap');
    var iosInitialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: androidInitialize, iOS: iosInitialize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initializationSettings,
        onSelectNotification: notificationSelected);
  }

  Future _showNotification() async{
    var androidDetails = new AndroidNotificationDetails("Channel ID", "farid", "description", importance: Importance.max,);
    var iosDetails = new IOSNotificationDetails();
    var generalNotiDetails = new NotificationDetails(android: androidDetails, iOS: iosDetails);

    await fltrNotification.show(0, "title", "body", generalNotiDetails);
  }
  
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
          title: const Text('salah times'),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/morocco.jpg.webp",
              ),
            ),
            ElevatedButton(
              onPressed: _showNotification,
              child: Text('CONTAINED BUTTON'),
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

  Future notificationSelected(String payload) async {}
}
