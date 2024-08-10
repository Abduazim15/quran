import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quron/bloc/surah_bloc.dart';

import '../data/constants.dart';
import '../models/quran_response.dart';

class SurahScreen extends StatefulWidget {
  const SurahScreen({super.key, required this.surahNumber});

  final int surahNumber;

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  late Surahs surah;
  late Surahs surah_uz;
  late List<int> likes;
  String name = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext _) {
    final bloc = BlocProvider.of<SurahBloc>(context);
    return BlocListener<SurahBloc, SurahState>(
      bloc: bloc,
      listener: (_, state) {
        if (state is SurahLoaded) {
          surah = state.surahs;
          surah_uz = state.surahs_uz;
          likes = state.likedAyahs;
          name = state.surahs_uz.englishName!;
          print(likes);
          setState(() {});
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            name,
            style: TextStyle(
                color: Constants.primaryColor, fontWeight: FontWeight.bold),
          ),
          scrolledUnderElevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search_rounded,
                    color: Constants.primaryColor,
                  )),
            )
          ],
        ),
        body: BlocBuilder(
          bloc: bloc,
          builder: (_, state) {
            if (state is SurahLoading) {
              return const CircularProgressIndicator();
            } else if (state is SurahLoaded) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (_, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 47,
                                padding:
                                    const EdgeInsets.only(left: 15, right: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0x0d121931)),
                                child: Row(
                                  children: [
                                    //index
                                    Container(
                                      width: 27,
                                      alignment: Alignment.center,
                                      height: 27,
                                      decoration: BoxDecoration(
                                        color: Constants.primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        '${index + 1}',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
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

                                          if (likes.contains(index)) {
                                            print('disliking');
                                            context.read<SurahBloc>().add(SurahSetLike(ayahNumber: index,  setLike: false, surahNumber: widget.surahNumber));
                                            likes.remove(index);
                                          } else {
                                            print('liking');
                                            context.read<SurahBloc>().add(SurahSetLike(ayahNumber: index, setLike: true, surahNumber: widget.surahNumber));
                                            likes.add(index);
                                          }
                                        });
                                      },
                                      icon: Icon(
                                        likes.contains(index)
                                            ? Icons.favorite
                                            : Icons.favorite_border_outlined,
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
                                  index == 0 && widget.surahNumber != 0
                                      ? surah.ayahs![index].text!
                                          .split(' ')
                                          .sublist(4)
                                          .join(' ')
                                      : surah.ayahs![index].text!,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'MADDINA',
                                      fontWeight: FontWeight.bold,
                                      color: Constants.primaryTextColor),
                                  textDirection: TextDirection.rtl,
                                  softWrap: true,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                '${index + 1}. ${surah_uz.ayahs![index].text!}',
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
                      },
                      itemCount: surah.ayahs?.length ?? 0,
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: Column(
                  children: [
                    const Text("Something went wrong!"),
                    OutlinedButton(
                      onPressed: () {
                        bloc.add(SurahLoad(surahNum: widget.surahNumber));
                      },
                      child: const Icon(Icons.refresh),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
