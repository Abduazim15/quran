import 'package:flutter/material.dart';
class SurahScreen extends StatefulWidget {
  const SurahScreen({super.key, required this.surahNumber});
  final int surahNumber;

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surahNumber.toString()),
      ),
    );
  }
}
