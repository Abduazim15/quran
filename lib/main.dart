import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quron/bloc/surah_bloc.dart';
import 'package:quron/models/quran_response.dart';
import 'package:quron/screens/home.dart';

import 'bloc/quran_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(QuranResponseAdapter());
  Hive.registerAdapter(SurahsAdapter());
  Hive.registerAdapter(AyahsAdapter());
  Hive.registerAdapter(DataAdapter());
  Hive.registerAdapter(EditionAdapter());

  await Hive.openBox('quran');
  await Hive.openBox('quran-uz');
  await Hive.openBox<String>('likes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(

        providers: [
          BlocProvider(create: (context) => QuranBloc()..add(QuranLoad()),),
          BlocProvider(create: (context) => SurahBloc()),
        ],
        child: const MainScreen(),
      ),
    );
  }
}























