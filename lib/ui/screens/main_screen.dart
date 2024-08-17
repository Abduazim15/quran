import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quron/bloc/quran_bloc.dart';
import 'package:quron/data/constants.dart';
import 'package:quron/ui/screens/home_screen.dart';
import 'package:quron/ui/screens/quran_screen.dart';
import 'dua_screen.dart';
import 'favourite_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = [];

  @override
  void initState() {
    pages = [
      HomeScreen(selectedIndexNotifier: _selectedIndex,),
      QuranPage(),
      DuaPage(),
      const FavouritedPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
          body: ValueListenableBuilder(
            builder: (context, selectedIndex, _) {
              return IndexedStack(
                index: selectedIndex,
                children: pages,
              );
            },
            valueListenable: _selectedIndex,
          ),
          bottomNavigationBar: ValueListenableBuilder(
            builder: (context, selectedIndex, _) {
              return BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined), label: 'Asosiy'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.book_outlined), label: 'Qur\'on'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.lightbulb_outlined), label: 'Duolar'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_border_outlined),
                      label: 'Saqlanganlar'),
                ],
                showSelectedLabels: true,
                currentIndex: selectedIndex,
                selectedItemColor: Constants.primaryColor,
                showUnselectedLabels: true,
                unselectedItemColor: Constants.greyColor,
                onTap: (index) {
                  setState(() {
                    _selectedIndex.value = index;
                  });
                },
              );
            },
            valueListenable: _selectedIndex,
          )),
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
                    border: Border.all(color: Constants.primaryColor)),
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
                              fontWeight: FontWeight.bold, fontSize: 16),
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
