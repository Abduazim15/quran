import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quron/bloc/like_bloc.dart';
import 'package:quron/bloc/surah_bloc.dart';
import 'package:quron/models/quran_response.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../bloc/quran_bloc.dart';
import '../data/constants.dart';

class FavouritedPage extends StatefulWidget {
  const FavouritedPage({super.key});

  @override
  State<FavouritedPage> createState() => _FavouritedPageState();
}

class _FavouritedPageState extends State<FavouritedPage> {
  List<Map<String, dynamic>> ayahs = [];
  List<String> surahNames = [];

  @override
  void initState() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
    context.read<LikeBloc>().add(LikeLoad());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LikeBloc, LikeState>(
      listener: (context, state) {
        if (state is LikeLoaded) {
          if(state.ayahs.isEmpty) return;
          surahNames.clear();
          var quranState = context.read<QuranBloc>().state as QuranLoaded;
          for (var ayah in state.ayahs) {
            surahNames
                .add(quranState.surahs_uz[ayah['surah_num']].englishName!);
          }
          print(surahNames.toString());
          setState(() {
            ayahs = state.ayahs;
          });
        }
      },
      child: VisibilityDetector(
        onVisibilityChanged: (info) {
          print('visibility changed');
          context.read<LikeBloc>().add(LikeLoad());
        },
        key: const Key('likes'),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Saqlanganlar',
              style: TextStyle(
                  color: Constants.primaryColor, fontWeight: FontWeight.bold),
            ),
            scrolledUnderElevation: 0,
          ),
          body: BlocBuilder<LikeBloc, LikeState>(
            builder: (context, state) {
              if (state is LikeLoaded) {
                if (state.ayahs.isNotEmpty) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: ayahs.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 47,
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: const Color(0x0d121931)),
                                      child: Row(
                                        children: [
                                          //index
                                          Text(
                                            surahNames[index],
                                            style: TextStyle(
                                                color: Constants.primaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          //share and save
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.share_outlined,
                                              color: Constants.primaryColor,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                print('disliking');
                                                context.read<SurahBloc>().add(
                                                    SurahSetLike(
                                                        ayahNumber: (ayahs[index]
                                                                        [
                                                                        'arabic']
                                                                    as Ayahs)
                                                                .numberInSurah! -
                                                            1,
                                                        setLike: false,
                                                        surahNumber: ayahs[
                                                                    index]
                                                                ['surah_num']
                                                            as int));
                                                ayahs.removeAt(index);
                                              });
                                            },
                                            icon: Icon(
                                              Icons.favorite,
                                              color: Constants.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        (ayahs[index]['arabic'] as Ayahs)
                                                        .numberInSurah! ==
                                                    1 &&
                                                (ayahs[index]['arabic']
                                                            as Ayahs)
                                                        .page !=
                                                    1
                                            ? (ayahs[index]['arabic']
                                                    as Ayahs)
                                                .text!
                                                .split(' ')
                                                .sublist(4)
                                                .join(' ')
                                            : (ayahs[index]['arabic']
                                                    as Ayahs)
                                                .text!,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontFamily: 'MADDINA',
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Constants.primaryTextColor),
                                        textDirection: TextDirection.rtl,
                                        softWrap: true,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      '${(ayahs[index]['arabic'] as Ayahs).numberInSurah!}. ${ayahs[index]['uzbek']}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Constants.primaryTextColor),
                                    ),
                                    const Divider(
                                      color: Color(0x0d121931),
                                      height: 40,
                                    )
                                  ],
                                ),
                              );
                            }),
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset('assets/animation/empty.json',
                            width: MediaQuery.of(context).size.width * 0.7),
                        SizedBox(height: 20),
                        Text(
                          'Saqlangan oyatlar yo\'q',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ],
                    ),
                  );
                }
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
