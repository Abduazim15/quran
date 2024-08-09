part of 'like_bloc.dart';

@immutable
abstract class LikeState {}

class LikeInitial extends LikeState {}
class LikeLoading extends LikeState {}
class LikeLoaded extends LikeState {
  final List<Map<String, dynamic>> ayahs;

  LikeLoaded({required this.ayahs});
}
