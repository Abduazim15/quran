import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quron/models/quran_response.dart';

class QuranService {
  Dio dio = Dio();
  var box = Hive.box('quran');
  var box_uz = Hive.box('quran-uz');
  var boxLike = Hive.box<String>('likes');
  String arabicUrl = 'https://api.alquran.cloud/v1/quran/quran-uthmani';
  String uzbekUrl = 'https://api.alquran.cloud/v1/quran/uz.sodik';

  Future<QuranResponse?> loadQuran(bool isArabic) async {
    try {
      Response response = await dio.get(isArabic ? arabicUrl : uzbekUrl);
      print(response.data);
      return QuranResponse.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }

  Future<Surahs> loadSurahFromDb(int surahNum, bool isArabic) async {
    var quran = isArabic
        ? await box.get('1') as QuranResponse
        : await box_uz.get('1') as QuranResponse;
    return quran.data!.surahs![surahNum];
  }

  Future<void> loadQuranToDb(QuranResponse response, bool isArabic) async {
    isArabic ? await box.put('1', response) : await box_uz.put('1', response);
  }

  Future<QuranResponse> loadQuranFromDb(bool isArabic) async {
    var quran = isArabic
        ? await box.get('1') as QuranResponse
        : await box_uz.get('1') as QuranResponse;
    return quran;
  }

  Future<void> setAsLiked(int surahNumber, int ayahNumber) async {
    // if(boxLike.values.where((element) => element == ayah).isEmpty) {
    await boxLike.put('$surahNumber:$ayahNumber','$surahNumber:$ayahNumber');
  }

  Future<void> setAsDisliked(int surahNumber, int ayahNumber) async {
    // if(boxLike.values.where((element) => element == ayah).isNotEmpty) {
    await boxLike.delete('$surahNumber:$ayahNumber');
  }

  Future<List<int>> getAllLikedAyahFromSurah(int surahNumber) async {
    List<int> ayahs = [];
    List<String> order = boxLike.values.toList();
    for (String i in order) {
      List<String> numbers = i.split(':');
      if (int.parse(numbers[0]) == surahNumber) {
        ayahs.add(int.parse(numbers[1]));
      }
    }
    return ayahs;
  }
  Future<List<Ayahs>> getAllFavorites() async{
    List<Ayahs> ayahs = [];
    var quran = await box.get('1') as QuranResponse;
    var quran_uz = await box_uz.get('1') as QuranResponse;

    return ayahs;

  }
}
