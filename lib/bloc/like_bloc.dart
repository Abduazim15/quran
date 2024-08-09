import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quron/quran_service.dart';

import '../models/quran_response.dart';

part 'like_event.dart';
part 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  final service = QuranService();
  LikeBloc() : super(LikeInitial()) {
    on<LikeLoad>((event, emit) async {
      emit(LikeLoading());
      var list = await service.getAllFavorites();
      emit(LikeLoaded(ayahs: list));
    });
  }
}
