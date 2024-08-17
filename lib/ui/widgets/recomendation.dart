import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../models/quran_response.dart';
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
          endChild: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.blueGrey),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(top: 10, bottom: 5, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Duas',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                Text(
                  'When waking up',
                  style: GoogleFonts.nunito(color: Colors.white, fontSize: 14),
                ),
                SizedBox(height: 5),
                Text('Robbi inni soimun', style: TextStyle(color: Colors.white54, fontStyle: FontStyle.italic),),
                SizedBox(height: 5),
                Text('My Lord, I am fasting', style: TextStyle(color: Colors.white, fontSize: 16),),
              ],
            ),
          ),
        ),
        TimelineTile(
          indicatorStyle: IndicatorStyle(width: 14),
          isLast: true,
        ),
      ],
    );
  }
}
