// As-salah list

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaah_remainder/widgets/Glassmorphism.dart';

class Salaah extends StatelessWidget {
  const Salaah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
            GlassMorphism(
              blur: 30,
              opacity: 0.3,
              child:
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
            ),),
        const SizedBox(height: 30),
            GlassMorphism(
              blur: 30,
              opacity: 0.3,
              child:
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
            ),
            const SizedBox(height: 30),
            GlassMorphism(
              blur: 30,
              opacity: 0.3,
              child:ListTile(
              title: const Text('asr'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('03:55 PM'),
                  SizedBox(width:30),
                  Icon(CupertinoIcons.bell_circle)
                ],
              )
            ),),
            const SizedBox(height: 30),
            GlassMorphism(
              blur: 30,
              opacity: 0.3,
              child:
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
            ),),
        const SizedBox(height: 30),
            GlassMorphism(
              blur: 30,
              opacity: 0.3,
              child:
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
            ),),
      ],
    );
  }
}
