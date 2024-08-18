import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quron/ui/widgets/allah_names.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../data/duas.dart';
import '../../models/quran_response.dart';
import 'daily_dua.dart';
import 'daily_verse.dart';

class Reccomendation extends StatefulWidget {
  const Reccomendation(
      {super.key, required this.surah, required this.dailyAyah});

  final Surahs? surah;
  final int dailyAyah;

  @override
  State<Reccomendation> createState() => _ReccomendationState();
}

class _ReccomendationState extends State<Reccomendation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimelineTile(
          isFirst: true,
          indicatorStyle: IndicatorStyle(width: 14),
          endChild: DailyVerse(
            surah: widget.surah,
            ayahNumber: widget.dailyAyah,
          ),
        ),
        TimelineTile(
          indicatorStyle: IndicatorStyle(width: 14),
          endChild: DailyDua(
            dua: duas[Random().nextInt(duas.length)],
          ),
        ),
        TimelineTile(
          indicatorStyle: IndicatorStyle(width: 14),
          endChild: Container(
            margin: EdgeInsets.only(top: 10, bottom: 5, left: 10),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.4,
                  width: MediaQuery.of(context).size.width,
                  child: AllahSvgWidget(
                    arabicName: 'الله',
                    spelling: 'Allah',
                    translation: 'Yagona iloh',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '99 Names of Allah',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      Text(
                        'Asma Al-Husna',
                        style: GoogleFonts.nunito(color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          isLast: true,
        ),
      ],
    );
  }
}
