
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/quran_response.dart';

class DailyVerse extends StatelessWidget {
  const DailyVerse({
    super.key,
    required this.surah,
    required this.ayahNumber,
  });

  final Surahs? surah;
  final int ayahNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 10, bottom: 5, left: 10),
      decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daily verse',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
          ),
          Text(
            '${surah?.englishName??''} (${surah?.number??''}:${ayahNumber+1})',
            style: GoogleFonts.nunito(color: Colors.white),
          ),
          SizedBox(height: 6),
          Text(
            surah?.ayahs![ayahNumber].text??'',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ],
      ),
    );
  }
}