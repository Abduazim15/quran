part of 'quran_bloc.dart';

@immutable
abstract class QuranState {}

class QuranInitial extends QuranState {}
class QuranLoading extends QuranState {}
class QuranLoaded extends QuranState {
  final List<Surahs> surahs;
  final List<Surahs> surahs_uz;

  QuranLoaded({required this.surahs_uz,required this.surahs});
}
class QuranError extends QuranState {}
