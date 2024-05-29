import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quron/bloc/quran_bloc.dart';
import 'package:quron/screens/surah_screen.dart';

import '../models/quran_response.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Surahs> surahs = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuranBloc, QuranState>(
      listener: (context, state) {
        if (state is QuranLoaded) {
          setState(() {
            surahs = state.surahs;
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Qur\'oni Karim',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black87,
          centerTitle: true,
          scrolledUnderElevation: 0,
        ),
        body: BlocBuilder<QuranBloc, QuranState>(builder: (context, state) {
          if (state is QuranLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is QuranLoaded) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SurahScreen(surahNumber: index+1,)));
                            },
                            child: ListTile(
                              title: Text(surahs[index].englishName!),
                              subtitle: Text(
                                  '${surahs[index].ayahs!.length} oyatdan iborat'),
                              trailing: Text(
                                surahs[index].name!,
                                style: const TextStyle(color: Colors.orange),
                              ),
                              leading: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.deepOrange, width: 1)),
                                child: Center(
                                    child:
                                        Text(surahs[index].number.toString())),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                          )
                        ],
                      );
                    },
                    itemCount: surahs.length,
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
      ),
    );
  }
}
