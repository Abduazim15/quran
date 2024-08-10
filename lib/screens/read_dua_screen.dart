import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/constants.dart';
import '../data/duas.dart';

class ReadDuaScreen extends StatefulWidget {
  const ReadDuaScreen({super.key, required this.dua});

  final Dua dua;

  @override
  State<ReadDuaScreen> createState() => _ReadDuaScreenState();
}

class _ReadDuaScreenState extends State<ReadDuaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Duo',
          style: GoogleFonts.nunito(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Constants.primaryColor.withOpacity(0.6),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                widget.dua.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  widget.dua.arabic,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'MADDINA',
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                  softWrap: true,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.dua.spelling ?? '',
                style: GoogleFonts.robotoFlex(),
              ),
              const SizedBox(height: 20),
              Text(
                widget.dua.translation,
                style: GoogleFonts.lexend(fontSize: 16),
              ),
              const SizedBox(height: 50),
              Center(
                child: Text(widget.dua.author != null ? '[${widget.dua.author}]' : '',
                    style: GoogleFonts.shantellSans()),
              ),
              const SizedBox(height: 30),
            ]),
          ),
        ),
      ),
    );
  }
}
