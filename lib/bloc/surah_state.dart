part of 'surah_bloc.dart';

@immutable
abstract class SurahState {}

class SurahInitial extends SurahState {}
class SurahLoading extends SurahState {}
class SurahLoaded extends SurahState {
  final Surahs surahs;
  final Surahs surahs_uz;
  final List<int> likedAyahs;

  SurahLoaded({required this.surahs, required this.surahs_uz, required this.likedAyahs
  });
}
class SurahError extends SurahState {}