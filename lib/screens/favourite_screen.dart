import 'package:flutter/material.dart';

class FavouritedPage extends StatefulWidget {
  const FavouritedPage({super.key});

  @override
  State<FavouritedPage> createState() => _FavouritedPageState();
}

class _FavouritedPageState extends State<FavouritedPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('saved'),),
    );
  }
}
