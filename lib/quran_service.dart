import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:quron/models/quran_response.dart';

class QuranService {
  Dio dio = Dio();

  Future<QuranResponse?> loadQuran() async {
    try {
        Response response = await dio.get('https://api.alquran.cloud/v1/quran/uz.sodik');
        print(response.data);
        return QuranResponse.fromJson(response.data);
    } catch (e) {
      throw e;
      print(e.toString());
    }
    return null;
  }
}
