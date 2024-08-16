import 'package:flutter/material.dart';
import 'package:quron/data/duas.dart';
import 'package:quron/ui/screens/dua_screen.dart';

import '../../data/constants.dart';

class DuaCategory extends StatefulWidget {
  const DuaCategory({super.key, required this.duas, required this.category});
  final List<Dua> duas;
  final String category;

  @override
  State<DuaCategory> createState() => _DuaCategoryState();
}

class _DuaCategoryState extends State<DuaCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category,
          style: TextStyle(
              color: Constants.primaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,

      ),
      body: AllDuas(duas: widget.duas),
    );
  }
}
