
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quron/bloc/quran_bloc.dart';
import 'package:quron/data/constants.dart';
import 'package:quron/screens/dua_screen.dart';
import 'package:quron/screens/favourite_screen.dart';
import 'package:quron/screens/quran_screen.dart';
import '../models/quran_response.dart';
import '../models/surah.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPage = 0;
  List<Widget> pages = [];
  @override
  void initState() {
    pages = [
      QuranPage(),
      const DuaPage(),
      const FavouritedPage()
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book_outlined),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.lightbulb_outlined),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined),label: ''),
        ],
        showSelectedLabels: false,
        currentIndex: currentPage,
        selectedItemColor: Constants.primaryColor,
        showUnselectedLabels: false,
        unselectedItemColor: Constants.greyColor,
        onTap: (index){
          setState(() {
            currentPage = index;
          });
        },
      ),
    );
  }
}