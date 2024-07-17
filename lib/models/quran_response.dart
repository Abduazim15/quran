import 'package:hive/hive.dart';

part 'quran_response.g.dart';

@HiveType(typeId: 0)
class QuranResponse {
  @HiveField(0)
  int? code;

  @HiveField(1)
  String? status;

  @HiveField(2)
  Data? data;

  QuranResponse({this.code, this.status, this.data});

  factory QuranResponse.fromJson(Map<String, dynamic> json) {
    return QuranResponse(
      code: json['code'],
      status: json['status'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 1)
class Data {
  @HiveField(0)
  List<Surahs>? surahs;

  @HiveField(1)
  Edition? edition;

  Data({this.surahs, this.edition});

  factory Data.fromJson(Map<String, dynamic> json) {
    if (json['surahs'] != null) {
      final List<Surahs> surahsList = [];
      json['surahs'].forEach((v) {
        surahsList.add(Surahs.fromJson(v));
      });
      return Data(
          surahs: surahsList, edition: Edition.fromJson(json['edition']));
    }
    return Data();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.surahs != null) {
      data['surahs'] = this.surahs!.map((v) => v.toJson()).toList();
    }
    if (this.edition != null) {
      data['edition'] = this.edition!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 2)
class Surahs {
  @HiveField(0)
  int? number;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? englishName;

  @HiveField(3)
  String? englishNameTranslation;

  @HiveField(4)
  String? revelationType;

  @HiveField(5)
  List<Ayahs>? ayahs;

  Surahs({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });

  factory Surahs.fromJson(Map<String, dynamic> json) {
    return Surahs(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      englishNameTranslation: json['englishNameTranslation'],
      revelationType: json['revelationType'],
      ayahs:
          List<Ayahs>.from(json['ayahs']?.map((x) => Ayahs.fromJson(x)) ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'name': name,
      'englishName': englishName,
      'englishNameTranslation': englishNameTranslation,
      'revelationType': revelationType,
      'ayahs': ayahs?.map((x) => x.toJson()).toList(),
    };
  }
}

@HiveType(typeId: 3)
class Ayahs {
  @HiveField(0)
  int? number;

  @HiveField(1)
  String? text;

  @HiveField(2)
  int? numberInSurah;

  @HiveField(3)
  int? juz;

  @HiveField(4)
  int? manzil;

  @HiveField(5)
  int? page;

  @HiveField(6)
  int? ruku;

  @HiveField(7)
  int? hizbQuarter;

  Ayahs({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
  });

  factory Ayahs.fromJson(Map<String, dynamic> json) {
    return Ayahs(
      number: json['number'],
      text: json['text'],
      numberInSurah: json['numberInSurah'],
      juz: json['juz'],
      manzil: json['manzil'],
      page: json['page'],
      ruku: json['ruku'],
      hizbQuarter: json['hizbQuarter'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'text': text,
      'numberInSurah': numberInSurah,
      'juz': juz,
      'manzil': manzil,
      'page': page,
      'ruku': ruku,
      'hizbQuarter': hizbQuarter,
    };
  }
}

@HiveType(typeId: 4)
class Edition {
  @HiveField(0)
  String? identifier;

  @HiveField(1)
  String? language;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? englishName;

  @HiveField(4)
  String? format;

  Edition({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
  });

  factory Edition.fromJson(Map<String, dynamic> json) {
    return Edition(
      identifier: json['identifier'],
      language: json['language'],
      name: json['name'],
      englishName: json['englishName'],
      format: json['format'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'language': language,
      'name': name,
      'englishName': englishName,
      'format': format,
    };
  }
}
