import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:quron/models/quran_response.dart';
import 'package:quron/quran_service.dart';

part 'quran_event.dart';

part 'quran_state.dart';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  QuranService service = QuranService();
  var box = Hive.box('quran');
  var box_uz = Hive.box('quran-uz');

  QuranBloc() : super(QuranInitial()) {
    on<QuranLoad>((event, emit) async {
      emit(QuranLoading());
      try {
        if(box.containsKey('1') && box_uz.containsKey('1')){
          QuranResponse db = await service.loadQuranFromDb(true);
          QuranResponse db_uz = await service.loadQuranFromDb(false);
          emit(QuranLoaded(surahs: db.data!.surahs!, surahs_uz: db_uz.data!.surahs!));
        } else {
          QuranResponse? response_arabic;
          QuranResponse? response_uz;
          if(!box.containsKey('1'))
            response_arabic = await service.loadQuran(true);
          if(!box_uz.containsKey('1'))
            response_uz = await service.loadQuran(false);
          print(response_uz);
          print(response_arabic);
          await service.loadQuranToDb(response_arabic!, true);
          await service.loadQuranToDb(response_uz!, false);
          emit(QuranLoaded(surahs: response_arabic.data!.surahs!, surahs_uz: response_uz.data!.surahs!));
        }
      } catch (e) {
        emit(QuranError());
        throw e;
      }
    });
  }
}
