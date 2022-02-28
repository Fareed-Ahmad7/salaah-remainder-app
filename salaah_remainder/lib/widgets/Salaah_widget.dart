// .  As-Salaah list

import 'package:flutter/material.dart';

class Salaah extends StatelessWidget {
  const Salaah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          title: Text('fajr'),
        ),
        ListTile(
          title: Text('zuhr'),
        ),
        ListTile(
          title: Text('asr'),
        ),
        ListTile(
          title: Text('magrib'),
        ),
        ListTile(
          title: Text('isha'),
        )
      ],
    );
  }
}
