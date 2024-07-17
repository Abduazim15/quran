part of 'surah_bloc.dart';

@immutable
abstract class SurahEvent {}
class SurahLoad extends SurahEvent{
  final int surahNum;

  SurahLoad({required this.surahNum});
}
class SurahSetLike extends SurahEvent{
  final int ayahNumber;
  final bool setLike;
  final int surahNumber;

  SurahSetLike({required this.ayahNumber, required this.setLike, required this.surahNumber});
}
