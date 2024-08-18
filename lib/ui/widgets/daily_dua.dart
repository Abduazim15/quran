import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quron/data/duas.dart';

class DailyDua extends StatelessWidget {
  const DailyDua({
    super.key, required this.dua,
  });
  final Dua dua;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            dua.name,
            style: GoogleFonts.nunito(color: Colors.white, fontSize: 14),
          ),
          SizedBox(height: 5),
          Text(dua.spelling??dua.arabic, style: TextStyle(color: Colors.white54, fontStyle: FontStyle.italic),),
          SizedBox(height: 5),
          Text(dua.translation, style: TextStyle(color: Colors.white, fontSize: 16),),
        ],
      ),
    );
  }
}
