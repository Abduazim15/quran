import 'package:flutter/material.dart';

import '../data/constants.dart';

class DuaPage extends StatefulWidget {
  const DuaPage({super.key});

  @override
  State<DuaPage> createState() => _DuaPageState();
}

class _DuaPageState extends State<DuaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Duolar',
          style: TextStyle(
              color: Constants.primaryColor, fontWeight: FontWeight.bold),
        ),
        scrolledUnderElevation: 0,
      ),
      body: Center(child: Text('Dua Page'),),
    );
  }
}
