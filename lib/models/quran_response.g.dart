part of 'quran_response.dart';

class QuranResponseAdapter extends TypeAdapter<QuranResponse> {
  @override
  final int typeId = 0;

  @override
  QuranResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuranResponse(
      code: fields[0] as int?,
      status: fields[1] as String?,
      data: fields[2] as Data?,
    );
  }

  @override
  void write(BinaryWriter writer, QuranResponse obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuranResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 1;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      surahs: (fields[0] as List?)?.cast<Surahs>(),
      edition: fields[1] as Edition?,
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.surahs)
      ..writeByte(1)
      ..write(obj.edition);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SurahsAdapter extends TypeAdapter<Surahs> {
  @override
  final int typeId = 2;

  @override
  Surahs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Surahs(
      number: fields[0] as int?,
      name: fields[1] as String?,
      englishName: fields[2] as String?,
      englishNameTranslation: fields[3] as String?,
      revelationType: fields[4] as String?,
      ayahs: (fields[5] as List?)?.cast<Ayahs>(),
    );
  }

  @override
  void write(BinaryWriter writer, Surahs obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.englishName)
      ..writeByte(3)
      ..write(obj.englishNameTranslation)
      ..writeByte(4)
      ..write(obj.revelationType)
      ..writeByte(5)
      ..write(obj.ayahs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurahsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AyahsAdapter extends TypeAdapter<Ayahs> {
  @override
  final int typeId = 3;

  @override
  Ayahs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ayahs(
      number: fields[0] as int?,
      text: fields[1] as String?,
      numberInSurah: fields[2] as int?,
      juz: fields[3] as int?,
      manzil: fields[4] as int?,
      page: fields[5] as int?,
      ruku: fields[6] as int?,
      hizbQuarter: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Ayahs obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.numberInSurah)
      ..writeByte(3)
      ..write(obj.juz)
      ..writeByte(4)
      ..write(obj.manzil)
      ..writeByte(5)
      ..write(obj.page)
      ..writeByte(6)
      ..write(obj.ruku)
      ..writeByte(7)
      ..write(obj.hizbQuarter);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AyahsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EditionAdapter extends TypeAdapter<Edition> {
  @override
  final int typeId = 4;

  @override
  Edition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Edition(
      identifier: fields[0] as String?,
      language: fields[1] as String?,
      name: fields[2] as String?,
      englishName: fields[3] as String?,
      format: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Edition obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.identifier)
      ..writeByte(1)
      ..write(obj.language)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.englishName)
      ..writeByte(4)
      ..write(obj.format);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EditionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
