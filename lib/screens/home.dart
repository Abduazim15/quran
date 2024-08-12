import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
    pages = [QuranPage(), const DuaPage(), const FavouritedPage()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        body: IndexedStack(
          index: currentPage,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.book_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.lightbulb_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined), label: ''),
          ],
          showSelectedLabels: false,
          currentIndex: currentPage,
          selectedItemColor: Constants.primaryColor,
          showUnselectedLabels: false,
          unselectedItemColor: Constants.greyColor,
          onTap: (index) {
            setState(() {
              currentPage = index;
            });
          },
        ),
      ),
      BlocBuilder<QuranBloc, QuranState>(builder: (context, state) {
        if (state is QuranLoading) {
          return Scaffold(
            body: Container(
              color: Colors.black54,
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: Constants.primaryColor)
                ),
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.2,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const LinearProgressIndicator(),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: const Text(
                          'Qur\'on oyatlari va tarjimalari yuklanmoqda.\n(15 Mb talab etiladi!)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),
              ),
            ),
          );
        } else
          return SizedBox();
      })
    ]);
  }
}
