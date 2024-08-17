import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quron/bloc/quran_bloc.dart';
import 'package:quron/data/constants.dart';
import 'package:quron/models/surah.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../models/quran_response.dart';
import '../widgets/my_button.dart';
import '../widgets/recomendation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.selectedIndexNotifier});

  final ValueNotifier<int> selectedIndexNotifier;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String continueReading = '1. Al-Fatiha | 7';
  Surahs? surah;
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width;
    return BlocListener<QuranBloc, QuranState>(
      listener: (BuildContext context, state) {
        if(state is QuranLoaded){
          var quran = state;
          setState(() {
          surah = quran.surahs_uz[Random().nextInt(114)+1];
          });
        }
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.hardEdge,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.red),
                      ),
                      child: ClipRRect(
                        child: Image.asset(
                          'assets/male_avatar.jpg',
                          fit: BoxFit.fill,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Salam, Abduazim',
                      style: GoogleFonts.nunito(fontSize: 20),
                    ),
                    const Spacer(),
                    Container(
                      width: 80,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        color: Constants.primaryColor.withOpacity(0.1),
                      ),
                      child: const Text('1'),
                    )
                  ],
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Colors.green.shade100),
                  height: height * 0.4,
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Continue Reading",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        continueReading,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                      const Spacer(),
                      MaterialButton(
                        height: 44,
                        onPressed: () {},
                        minWidth: double.infinity,
                        shape: const StadiumBorder(),
                        child: const Text(
                          'Go',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      buildSpending('Today', '0:43', '', Constants.primaryColor),
                      const SizedBox(width: 16),
                      buildSpending('Week', '3:43', '', Colors.blueAccent),
                      const SizedBox(width: 16),
                      buildSpending('All', '12:43', '', Colors.orangeAccent),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    widget.selectedIndexNotifier.value = 2;
                  },
                  child: myNavigateButton(
                    title: "Duas",
                    subtitle: "Bright your life with duas!",
                    startColor: Constants.primaryColor,
                    endColor: Colors.purpleAccent,
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    widget.selectedIndexNotifier.value = 1;
                  },
                  child: const myNavigateButton(
                    title: "Quran",
                    subtitle: "Time to get Shafa'ah!",
                    startColor: Colors.black,
                    endColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "  What's new",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Reccomendation(surah: surah, dailyAyah: Random().nextInt(surah?.ayahs?.length ?? 1),)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildSpending(
      String title, String subtitle, String asset, Color borderColor) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(26)),
            border: Border.all(color: borderColor)),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.favorite,
              color: Colors.redAccent,
            ),
            Text(title),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}


