import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quron/quran_service.dart';

import '../models/quran_response.dart';

part 'surah_event.dart';

part 'surah_state.dart';

class SurahBloc extends Bloc<SurahEvent, SurahState> {
  QuranService service = QuranService();

  SurahBloc() : super(SurahInitial()) {
    on<SurahLoad>((event, emit) async {
      emit(SurahLoading());
      try {
        var surah = await service.loadSurahFromDb(event.surahNum, true);
        var surah_uz = await service.loadSurahFromDb(event.surahNum, false);
        var likes = await service.getAllLikedAyahFromSurah(event.surahNum);
        emit(
            SurahLoaded(surahs: surah, surahs_uz: surah_uz, likedAyahs: likes));
      } catch (e) {
        emit(SurahError());
        print(e);
      }
    });
    on<SurahSetLike>((event, emit) async {
      if (event.setLike) {
        await service.setAsLiked(event.surahNumber, event.ayahNumber);
      } else {
        await service.setAsDisliked(event.surahNumber, event.ayahNumber);
      }
    });
  }
}
