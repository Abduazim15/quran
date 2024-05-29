import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quron/models/quran_response.dart';
import 'package:quron/quran_service.dart';

part 'quran_event.dart';

part 'quran_state.dart';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  QuranService service = QuranService();

  QuranBloc() : super(QuranInitial()) {
    on<QuranLoad>((event, emit) async {
      emit(QuranLoading());
      try {
        QuranResponse? response = await service.loadQuran();
        emit(QuranLoaded(surahs: response!.data!.surahs!));
      } catch (e) {
        emit(QuranError());
        throw e;
      }
    });
  }
}
