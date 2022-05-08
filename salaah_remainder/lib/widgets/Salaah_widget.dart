// As-salah list
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salaah_remainder/widgets/Glassmorphism.dart';
import 'package:intl/intl.dart';

class Salaah extends StatefulWidget {
  const Salaah({Key? key}) : super(key: key);

  @override
  State<Salaah> createState() => _SalaahState();
}

class _SalaahState extends State<Salaah> {
  @override
  Widget build(BuildContext context) {
    // getting todays date and month
    var now = new DateTime.now();
    var formatter = new DateFormat('MMMM');
    var formatter1 = new DateFormat('d');
    var formatter2 = new DateFormat.Hm();
    String formattedDate = formatter.format(now);
    String formattedDate1 = formatter1.format(now);
    String formattedDate2 = formatter2.format(now);
    String month = formattedDate.toLowerCase();
    String day = formattedDate1;
    // getting current time
    String ctime = formattedDate2;
    String c = ctime;
    var mc = c.replaceAll(new RegExp(r'[^\w\s]+'), '');
    var ct = int.parse(mc);

    // bcz i only written 4 days of timing per month in firebase
    // i'm doing this hack rather i would have to write 365 days of timing per year
    // so the app updates time only at interval of 7days.
    // app updates salah timings 4 times a month.

    var day1 = int.parse(day);
    if (day1 > 1 && day1 < 8) {
      day1 = 1;
    }
    if (day1 > 8 && day1 < 15) {
      day1 = 8;
    }
    if (day1 > 15 && day1 < 22) {
      day1 = 15;
    }
    if (day1 > 22 && day1 < 31) {
      day1 = 22;
    }

    // initializing firestore database
    // using stream builder
    final Stream<QuerySnapshot> TimeStream = FirebaseFirestore.instance
        .collection('/$month/g5WAa3ZrjYJBE7YewdCX/$day1')
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: TimeStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        // tackling edge cases
        if (snapshot.hasError) {
          print('An error occured.');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        // fetching data from firestore
        final List storedocs = []; // creating a list to store data
        snapshot.data!.docs.map((DocumentSnapshot document) {
          Map a = document.data() as Map<String, dynamic>;
          storedocs.add(a);
        }).toList();
        // accessing times from storedocs map/dictionary
        String fajrTime = '';
        String dhuhrTime = '';
        String asrTime = '';
        String magribTime = '';
        String ishaTime = '';
        for (var i = 0; i < storedocs.length; i++) {
          fajrTime = (storedocs[i]['Fajr']);
          dhuhrTime = (storedocs[i]['Dhuhr']);
          asrTime = (storedocs[i]['Asr']);
          magribTime = (storedocs[i]['Magrib']);
          ishaTime = (storedocs[i]['Isha']);
        }
        // printing list to verify data reading
        // print(fajrTime);

        // comparing local time with firebase salah times
        // first remove : from salah times
        String f = fajrTime;
        var mf = f.replaceAll(new RegExp(r'[^\w\s]+'), '');
        var ft = int.parse(mf);

        String d = dhuhrTime;
        var md = d.replaceAll(new RegExp(r'[^\w\s]+'), '');
        var dt = int.parse(md);

        String a = asrTime;
        var ma = a.replaceAll(new RegExp(r'[^\w\s]+'), '');
        var at = int.parse(ma);

        String m = magribTime;
        var mm = m.replaceAll(new RegExp(r'[^\w\s]+'), '');
        var mt = int.parse(mm);

        String i = ishaTime;
        var mi = i.replaceAll(new RegExp(r'[^\w\s]+'), '');
        var it = int.parse(mi);
        // ct = 2400;
        // blur and opacity variables
        double bf = 30;
        double of = 0.3;
        double bd = 30;
        double od = 0.3;
        double ba = 30;
        double oa = 0.3;
        double bm = 30;
        double om = 0.3;
        double bi = 30;
        double oi = 0.3;

        if (ct <= 1200) {
          if (ct >= ft && ct < dt) {
            // print('its fajr');
            bf = 80;
            of = 0.6;
          } else {
            // print('its isha');
            bi = 80;
            oi = 0.6;
          }
        } else if (ct > 1200) {
          if (ct >= dt && ct - 1200 < at) {
            // print('its dhuhr');
            bd = 80;
            od = 0.6;
          }
          if (ct < dt) {
            // print('its fajr');
            bf = 80;
            of = 0.6;
          }
          if (ct - 1200 >= at && ct - 1200 < mt) {
            // print('its asr');
            ba = 80;
            oa = 0.6;
          }
          if (ct - 1200 >= mt && ct - 1200 < it) {
            // print('its magrib');
            bm = 80;
            om = 0.6;
          }
          if (ct - 1200 >= it) {
            //  print('its isha');
            bi = 80;
            oi = 0.6;
          }
        }
        return ListView(
          shrinkWrap: true,
          children: [
            GlassMorphism(
              blur: bf,
              opacity: of,
              child: ListTile(
                  title: const Text('fajr'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("$fajrTime AM"),
                      const SizedBox(width: 30),
                      const Icon(CupertinoIcons.bell_circle)
                    ],
                  )),
            ),
            const SizedBox(height: 30),
            GlassMorphism(
              blur: bd,
              opacity: od,
              child: ListTile(
                  title: const Text('dhuhr'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("$dhuhrTime PM"),
                      const SizedBox(width: 30),
                      const Icon(CupertinoIcons.bell_circle)
                    ],
                  )),
            ),
            const SizedBox(height: 30),
            GlassMorphism(
              blur: ba,
              opacity: oa,
              child: ListTile(
                  title: const Text('asr'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("$asrTime PM"),
                      const SizedBox(width: 30),
                      const Icon(CupertinoIcons.bell_circle)
                    ],
                  )),
            ),
            const SizedBox(height: 30),
            GlassMorphism(
              blur: bm,
              opacity: om,
              child: ListTile(
                  title: const Text('magrib'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("$magribTime PM"),
                      const SizedBox(width: 30),
                      const Icon(CupertinoIcons.bell_circle)
                    ],
                  )),
            ),
            const SizedBox(height: 30),
            GlassMorphism(
              blur: bi,
              opacity: oi,
              child: ListTile(
                  title: const Text('isha'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("$ishaTime PM"),
                      const SizedBox(width: 30),
                      const Icon(CupertinoIcons.bell_circle)
                    ],
                  )),
            ),
          ],
        );
      },
    );
  }
}
