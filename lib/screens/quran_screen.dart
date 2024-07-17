import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quron/screens/surah_screen.dart';

import '../bloc/quran_bloc.dart';
import '../bloc/surah_bloc.dart';
import '../data/constants.dart';
import '../models/quran_response.dart';
import '../models/surah.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  List<Surah> surahsOnlyName = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuranBloc, QuranState>(
      listener: (context, state) {
        if (state is QuranLoaded) {
          setState(() {
            surahsOnlyName = extractNames(state.surahs);
          });
        }
      },
      child: BlocBuilder<QuranBloc, QuranState>(builder: (context, state) {
        if (state is QuranLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is QuranLoaded) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => SurahBloc()
                                    ..add(SurahLoad(surahNum: index)),
                                  child: SurahScreen(
                                    surahNumber: index,
                                  ),
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            title: Text(
                              surahsOnlyName[index].name,
                              style: TextStyle(
                                  color: Constants.primaryTextColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '${surahsOnlyName[index].ayahsNumber} oyatdan iborat',
                              style: TextStyle(color: Constants.greyColor),
                            ),
                            trailing: Text(
                              surahsOnlyName[index]
                                  .arabicName
                                  .split(' ')
                                  .sublist(1)
                                  .join(' '),
                              style: TextStyle(
                                  color: Constants.primaryColor,
                                  fontSize: 18,
                                  fontFamily: 'MADDINA',
                                  fontWeight: FontWeight.bold),
                            ),
                            leading: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Constants.primaryColor, width: 1),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                  child: Text(
                                surahsOnlyName[index].order.toString(),
                                style: const TextStyle(fontSize: 14),
                              )),
                            ),
                          ),
                        ),
                        const Divider(
                          height: 1,
                        )
                      ],
                    );
                  },
                  itemCount: surahsOnlyName.length,
                  physics: const BouncingScrollPhysics(),
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: Column(
              children: [
                const Text("Something went wrong!"),
                OutlinedButton(
                  onPressed: () {
                    context.read<QuranBloc>().add(QuranLoad());
                  },
                  child: const Icon(Icons.refresh),
                )
              ],
            ),
          );
        }
      }),
    );
  }

  List<Surah> extractNames(List<Surahs> surahs) {
    List<Surah> surah = [];
    for (var sur in surahs) {
      surah.add(Surah(
          name: sur.englishName!,
          arabicName: sur.name!,
          ayahsNumber: sur.ayahs!.length,
          order: sur.number!));
    }
    return surah;
  }
}
