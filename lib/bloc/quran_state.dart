part of 'quran_bloc.dart';

@immutable
abstract class QuranState {}

class QuranInitial extends QuranState {}
class QuranLoading extends QuranState {}
class QuranLoaded extends QuranState {
  final List<Surahs> surahs;

  QuranLoaded({required this.surahs});
}
class QuranError extends QuranState {}
