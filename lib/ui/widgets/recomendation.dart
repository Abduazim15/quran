import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../data/duas.dart';
import '../../models/quran_response.dart';
import 'allah_99_name.dart';
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
          endChild: Allah99Name(),
          isLast: true,
        ),
      ],
    );
  }
}
