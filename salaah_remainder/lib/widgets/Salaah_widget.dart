// .  As-Salaah list

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Salaah extends StatelessWidget {
  const Salaah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
            ListTile(
              title: const Text('fajr'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('05:26 AM'),
                  SizedBox(width:30),
                  Icon(CupertinoIcons.bell_circle)
                ],
              )
            ),
            ListTile(
              title: const Text('dhuhr'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('12:38 PM'),
                  SizedBox(width:30),
                  Icon(CupertinoIcons.bell_circle)
                ],
              )
            ),
            ListTile(
              title: const Text('asr'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('03:55 PM'),
                  SizedBox(width:30),
                  Icon(CupertinoIcons.bell_circle)
                ],
              )
            ),
            ListTile(
              title: const Text('magrib'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('06:31 PM'),
                  SizedBox(width:30),
                  Icon(CupertinoIcons.bell_circle)
                ],
              )
            ),
            ListTile(
              title: const Text('isha'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('07:40 PM'),
                  SizedBox(width:30),
                  Icon(CupertinoIcons.bell_circle)
                ],
              )
            ),
      ],
    );
  }
}
