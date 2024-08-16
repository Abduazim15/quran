class Dua {
  final String name;
  final String arabic;
  final String translation;
  final String? author;
  final String? spelling;
  final DuaCategories? category;

  Dua(
      {required this.category,
      required this.name,
      required this.arabic,
      required this.author,
      required this.spelling,
      required this.translation});
}

enum DuaCategories {
  MORNING,
  EVENING,
  SLEEP,
  SALAH,
  AFTER_SALAH,
  SALAWAT,
  QURANIC_DUAS,
  SUNNAH_DUAS,
  ISTIGHFAR,
  DHIKR_FOR_ALL_TIMES,
  MOSQUE,
  OTHER,
  FAMILY,
}

class StringPair {
  final String name;
  final String asset;

  StringPair(this.name, this.asset);
}

extension DuaCategoriesExtension on DuaCategories {
  StringPair get value {
    switch (this) {
      case DuaCategories.MORNING:
        return StringPair('Tongi', 'assets/dua.png');
      case DuaCategories.EVENING:
        return StringPair('Kechgi', 'assets/dua.png');
      case DuaCategories.SLEEP:
        return StringPair('Uyqudan avval', 'assets/dua.png');
      case DuaCategories.SALAH:
        return StringPair('Namozdagi', 'assets/dua.png');
      case DuaCategories.AFTER_SALAH:
        return StringPair("Namozdan so'ng", 'assets/dua.png');
      case DuaCategories.SALAWAT:
        return StringPair('Salovatlar', 'assets/dua.png');
      case DuaCategories.QURANIC_DUAS:
        return StringPair("Qur'oniy duolar", 'assets/dua.png');
      case DuaCategories.SUNNAH_DUAS:
        return StringPair('Sunnat duolar', 'assets/dua.png');
      case DuaCategories.ISTIGHFAR:
        return StringPair("Istig'for", 'assets/dua.png');
      case DuaCategories.DHIKR_FOR_ALL_TIMES:
        return StringPair('Kunlik zikrlar', 'assets/dua.png');
      case DuaCategories.MOSQUE:
        return StringPair('Kunlik zikrlar', 'assets/dua.png');
      case DuaCategories.OTHER:
        return StringPair('Boshqalar', 'assets/dua.png');
      case DuaCategories.FAMILY:
        return StringPair('Oila', 'assets/dua.png');
      default:
        return StringPair('', '');
    }
  }
}

List<Dua> duas = [
  Dua(
    category: DuaCategories.MORNING,
    name: "Tong duosi",
    arabic: "أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلَّهِ",
    translation:
        "Biz yangi kunga kirdik va bu bilan barcha hukm Allohga tegishlidir.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Asbahna wa asbaha al-mulku lillah",
  ),
  Dua(
      name: "Uyqudan oldin",
      arabic: "اللَّهُمَّ بِاسْمِكَ أَمُوتُ وَأَحْيَا",
      translation: "Ey Alloh, Sening isming bilan o'laman va tirilaman.",
      author: "Payg'ambar Muhammad (SAV)",
      spelling: "Allahumma bismika amootu wa ahyaa",
      category: DuaCategories.SLEEP),
  Dua(
      name: "Mag'firat so'rash",
      arabic: "رَبِّ اغْفِرْ لِي وَارْحَمْنِي",
      translation: "Parvardigorim, meni kechir va menga rahm qil.",
      author: "Payg'ambar Muhammad (SAV)",
      spelling: "Rabbighfir li warhamni",
      category: DuaCategories.ISTIGHFAR),
  Dua(
      name: "Hidoyat so'rash",
      arabic: "اللَّهُمَّ اهْدِنِي وَسَدِّدْنِي",
      translation:
          "Ey Alloh, meni to'g'ri yo'lga boshlab qo'y va menga sobitlik ber.",
      author: "Payg'ambar Muhammad (SAV)",
      spelling: "Allahumma ihdini wasaddidni",
      category: DuaCategories.SUNNAH_DUAS),
  Dua(
      name: "Masjidga kirishda",
      arabic: "اللَّهُمَّ افْتَحْ لِي أَبْوَابَ رَحْمَتِكَ",
      translation: "Ey Alloh, men uchun rahmat eshiklarini och.",
      author: "Payg'ambar Muhammad (SAV)",
      spelling: "Allahumma iftah li abwaba rahmatika",
      category: DuaCategories.MOSQUE,),
  Dua(
    name: "Masjiddan chiqishda",
    arabic: "اللَّهُمَّ إِنِّي أَسْأَلُكَ مِنْ فَضْلِكَ",
    translation: "Ey Alloh, Sendan fazlingni so'rayman.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma inni asaluka min fadhlika",
      category: DuaCategories.MOSQUE,
  ),
  Dua(
    name: "Sabr so'rash",
    arabic: "رَبَّنَا أَفْرِغْ عَلَيْنَا صَبْرًا",
    translation: "Parvardigorim, bizga sabr ber.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Rabbana afrigh 'alayna sabran",
      category: DuaCategories.QURANIC_DUAS
  ),
  Dua(
    name: "Rahm-shafqat so'rash",
    arabic: "رَبِّ ارْحَمْهُمَا كَمَا رَبَّيَانِي صَغِيرًا",
    translation: "Parvardigorim, meni tarbiya qilganlarida ularga rahm qil.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Rabbir hamhuma kama rabbayani saghira",
      category: DuaCategories.QURANIC_DUAS
  ),
  Dua(
    name: "Ovqatlanishdan oldin",
    arabic: "بِسْمِ اللَّهِ وَبَرَكَةِ اللَّهِ",
    translation: "Allohning ismi va Allohning barakasi bilan.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Bismillah wa barakatillah",
      category: DuaCategories.SUNNAH_DUAS
  ),
  Dua(
    name: "Ovqatdan so'ng",
    arabic: "الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَنَا وَسَقَانَا",
    translation: "Bizni ovqatlantirgan va ichirgan Allohga hamdlar bo'lsin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Alhamdulillah alladhi atamana wasaqana",
      category: DuaCategories.SUNNAH_DUAS
  ),
  Dua(
    name: "Uyqudan uyg'onganda",
    arabic: "الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا",
    translation:
        "Bizni o'limimizdan keyin tiriltirgan Allohga hamdlar bo'lsin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Alhamdulillah alladhi ahyana ba'da ma amatana",
      category: DuaCategories.SLEEP
  ),
  Dua(
    name: "Og'riqni ketkazish uchun",
    arabic: "اللَّهُمَّ اشْفِ أَنْتَ الشَّافِي",
    translation: "Ey Alloh, davolovchi Sening o'zingdir.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma ishfi anta ash-shafi",
      category: DuaCategories.SUNNAH_DUAS
  ),
  Dua(
    name: "Qarzdorlikdan qutilish uchun",
    arabic: "اللَّهُمَّ اكْفِنِي بِحَلالِكَ عَنْ حَرَامِكَ",
    translation: "Ey Alloh, haromdan xalos qiladigan halolni menga yetkaz.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma ikfini bihalalika an haramika",
      category: DuaCategories.SUNNAH_DUAS
  ),
  Dua(
    name: "Qiyinchilikda yordam so'rash",
    arabic: "اللَّهُمَّ لَا سَهْلَ إِلَّا مَا جَعَلْتَهُ سَهْلًا",
    translation: "Ey Alloh, Sen oson qilmaguningcha hech narsa oson emas.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma la sahla illa ma ja'altahu sahlan",
      category: DuaCategories.SUNNAH_DUAS
  ),
  Dua(
    name: "Qur'on o'qishdan oldin",
    arabic: "اللَّهُمَّ إِنِّي أَسْأَلُكَ فَهْمَ النَّبِيِّينَ",
    translation:
        "Ey Alloh, men Sendan payg'ambarlarning tushunishini so'rayman.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma inni asaluka fahman nabiyin",
      category: DuaCategories.QURANIC_DUAS
  ),
  Dua(
    name: "Duo qilishdan oldin",
    arabic: "اللَّهُمَّ إِنِّي أَسْأَلُكَ أَنْ تَسْتَجِيبَ دُعَائِي",
    translation: "Ey Alloh, duolarimni qabul qilishingni so'rayman.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma inni asaluka an tastajeeba du'ai",
      category: DuaCategories.AFTER_SALAH
  ),
  Dua(
    name: "Safarda chiqishdan oldin",
    arabic: "اللَّهُمَّ أَنْتَ الصَّاحِبُ فِي السَّفَرِ",
    translation: "Ey Alloh, Sen safardagi do'stimizsan.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma anta as-sahibu fi safar",
      category: DuaCategories.OTHER,
  ),
  Dua(
    name: "Namozdan keyin",
    arabic: "اللَّهُمَّ أَنْتَ السَّلَامُ وَمِنْكَ السَّلَامُ",
    translation: "Ey Alloh, Sen tinchlikdasan va Sendan tinchlik keladi.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma anta as-salamu wa minka as-salam",
      category: DuaCategories.AFTER_SALAH
  ),
  Dua(
    name: "Yaxshi xulq so'rash",
    arabic: "اللَّهُمَّ حَسِّنْ خُلُقِي كَمَا حَسَّنْتَ خَلْقِي",
    translation:
        "Ey Alloh, xulqimni go'zal qilgin, xuddi go'zal yaratayotganingdek.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma hassin khuluqi kama hassanta khalqi",
      category: DuaCategories.DHIKR_FOR_ALL_TIMES
  ),
  Dua(
    name: "Iymonni mustahkamlash",
    arabic: "اللَّهُمَّ زِدْنِي إِيمَانًا",
    translation: "Ey Alloh, iymonimni ziyoda qil.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma zidni imanan",
      category: DuaCategories.DHIKR_FOR_ALL_TIMES
  ),
  Dua(
    name: "Ko'zni yomon narsalardan himoya qilish",
    arabic: "اللَّهُمَّ احْفَظْ عَيْنَيَّ مِنَ الْحَرَامِ",
    translation: "Ey Alloh, ko'zlarimni harom narsalardan saqla.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma ihfaz aynayya minal haram",
      category: DuaCategories.DHIKR_FOR_ALL_TIMES
  ),
  Dua(
    name: "Og'izni yomon gaplardan saqlash",
    arabic: "اللَّهُمَّ احْفَظْ لِسَانِي مِنَ السُّوءِ",
    translation: "Ey Alloh, tilimni yomon gaplardan saqla.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma ihfaz lisani minal su'",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "Quloqlarni yomon narsalardan saqlash",
    arabic: "اللَّهُمَّ احْفَظْ أُذُنَيَّ مِنَ الْحَرَامِ",
    translation: "Ey Alloh, quloqlarimni harom narsalardan saqla.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma ihfaz udhunayya minal haram",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "Qo'llarni harom narsalardan saqlash",
    arabic: "اللَّهُمَّ احْفَظْ يَدَيَّ مِنَ الْحَرَامِ",
    translation: "Ey Alloh, qo'llarimni harom narsalardan saqla.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma ihfaz yadaya minal haram",
      category: DuaCategories.ISTIGHFAR
  ),
  Dua(
    name: "Qalbni harom narsalardan saqlash",
    arabic: "اللَّهُمَّ طَهِّرْ قَلْبِي مِنَ النِّفَاقِ",
    translation: "Ey Alloh, qalbimni nifoqdan pokla.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma tahhir qalbi minan nifaq",
      category: DuaCategories.ISTIGHFAR
  ),
  Dua(
    name: "Rizqni kengaytirish uchun",
    arabic: "اللَّهُمَّ ارْزُقْنِي حَلَالًا وَوَاسِعًا",
    translation: "Ey Alloh, menga halol va keng rizq bergin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma arzuqni halalan wa wasian",
      category: DuaCategories.SUNNAH_DUAS
  ),
  Dua(
    name: "Oila uchun duo",
    arabic: "رَبِّ اجْعَلْنِي وَذُرِّيَّتِي مِنَ الصَّالِحِينَ",
    translation: "Parvardigorim, meni va naslimni solihlardan qilgin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Rabbij'alni wa dhurriyati minassalihin",
      category: DuaCategories.FAMILY
  ),
  Dua(
    name: "Bolalar uchun duo",
    arabic: "اللَّهُمَّ اجْعَلْ أَوْلَادِي مِنَ الْمُتَّقِينَ",
    translation: "Ey Alloh, bolalarimni taqvodorlardan qilgin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma aj'al awladi minal muttaqin",
      category: DuaCategories.FAMILY
  ),
  Dua(
    name: "Makkani ziyorat qilish niyati bilan",
    arabic: "اللَّهُمَّ ارزُقْنِي زِيَارَةَ بَيْتِكَ الْحَرَامِ",
    translation: "Ey Alloh, menga uyingsa ziyorat qilishni nasib qilgin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma arzuqni ziyarata baytikal haram",
      category: DuaCategories.MOSQUE
  ),
  Dua(
    name: "Allohning yo'lida jon fido qilish uchun",
    arabic: "اللَّهُمَّ اجْعَلْنِي مِنَ الشُّهَدَاءِ",
    translation: "Ey Alloh, meni shahidlar qatoriga qo'sh.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma aj'alni minash shuhada'",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "Payg'ambar (SAV) uchun salovat",
    arabic: "اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ",
    translation: "Ey Alloh, Muhammadga va uning oilasiga rahmat yubor.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma salli ala Muhammad wa ala ali Muhammad",
      category: DuaCategories.SALAWAT
  ),
  Dua(
    name: "Qiyomat kunidagi shafqat so'rash",
    arabic: "اللَّهُمَّ ارْزُقْنِي شَفَاعَةَ نَبِيِّكَ",
    translation: "Ey Alloh, menga payg'ambaringning shafoatini nasib qilgin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma arzuqni shafa'ata nabiyika",
      category: DuaCategories.SALAWAT
  ),
  Dua(
    name: "To'g'ri yo'l so'rash",
    arabic: "اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ",
    translation: "Bizni to'g'ri yo'lga boshlagin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Ihdinas siratal mustaqim",
      category: DuaCategories.SUNNAH_DUAS
  ),
  Dua(
    name: "Dushmanlardan himoya so'rash",
    arabic: "اللَّهُمَّ احْفَظْنِي مِنْ شَرِّ أَعْدَائِي",
    translation: "Ey Alloh, meni dushmanlarimning yomonligidan saqla.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma ihfazni min sharri a'da'i",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "Yomon ko'zdan saqlanish",
    arabic: "أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ",
    translation:
        "Allohning mukammal so'zlari bilan U yaratgan yomonlikdan panoh so'rayman.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "A'udhu bikalimatillahi tammati min sharri ma khalaq",
      category: DuaCategories.SUNNAH_DUAS
  ),
  Dua(
    name: "Haj niyati bilan",
    arabic: "اللَّهُمَّ ارزُقْنِي حَجَّ بَيْتِكَ الْحَرَامِ",
    translation: "Ey Alloh, menga uyingsa haj qilishni nasib qilgin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma arzuqni hajja baytikal haram",
      category: DuaCategories.MOSQUE
  ),
  Dua(
    name: "Yomonlikka qarshi panoh so'rash",
    arabic: "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الشَّرِّ كُلِّهِ",
    translation: "Ey Alloh, men Sendan har qanday yomonlikdan panoh so'rayman.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma inni a'udhu bika minash sharri kullihi",
      category: DuaCategories.ISTIGHFAR
  ),
  Dua(
    name: "Dunyo fitnasidan panoh so'rash",
    arabic: "اللَّهُمَّ نَجِّنِي مِنْ فِتْنَةِ الدُّنْيَا",
    translation: "Ey Alloh, meni dunyo fitnasidan saqla.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma najjini min fitnati dunya",
      category: DuaCategories.ISTIGHFAR
  ),
  Dua(
    name: "Ajali yaqin bo'lgan kishilar uchun duo",
    arabic: "اللَّهُمَّ إِنْ كَانَ عُمْرِي بَقِيَ فَاحْفَظْنِي",
    translation: "Ey Alloh, agar hayotim qoldiysa, meni saqla.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma in kana umri baqiya fahfazni",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "Shifo so'rash",
    arabic: "اللَّهُمَّ اشْفِ أَنْتَ الشَّافِي",
    translation: "Ey Alloh, shifo beruvchi Sening o'zingdir.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma ishfi anta ash-shafi",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "Og'riqni ketkazish uchun",
    arabic: "اللَّهُمَّ ذْهِبْ عَنِّي الْبَاسَ",
    translation: "Ey Alloh, mendan og'riqni ketkazgin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma idhhab anni al-basa",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "Duo qabul bo'lishi uchun",
    arabic: "اللَّهُمَّ إِنِّي أَسْأَلُكَ قَبُولَ دُعَائِي",
    translation: "Ey Alloh, duolarimni qabul qilishingni so'rayman.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma inni asaluka qabula du'ai",
      category: DuaCategories.DHIKR_FOR_ALL_TIMES
  ),
  Dua(
    name: "Ajal yaqinlashganida",
    arabic: "اللَّهُمَّ اجْعَلْ خَاتِمَتِي خَيْرًا",
    translation: "Ey Alloh, oxirimni xayrli qilgin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma aj'al khatimati khayran",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "Iymonni kuchaytirish uchun",
    arabic: "اللَّهُمَّ زِدْنِي إِيمَانًا وَثَبِّتْنِي عَلَيْهِ",
    translation: "Ey Alloh, iymonimni ziyoda qil va unga sobit qilgin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma zidni imanan wathabbitni 'alayhi",
      category: DuaCategories.DHIKR_FOR_ALL_TIMES
  ),
  Dua(
    name: "Gunohlardan tozalash uchun",
    arabic: "اللَّهُمَّ طَهِّرْنِي مِنَ الذُّنُوبِ",
    translation: "Ey Alloh, meni gunohlardan pokla.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma tahhirni minadh-dhunub",
      category: DuaCategories.ISTIGHFAR
  ),
  Dua(
    name: "Bola tug'ilganida",
    arabic: "اللَّهُمَّ اجْعَلْهُ ذُرِّيَّةً صَالِحَةً",
    translation: "Ey Alloh, uni solih avlod qilgin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma aj'alhu dhurriyyatan saliha",
      category: DuaCategories.FAMILY
  ),
  Dua(
    name: "Himmat so'rash",
    arabic: "اللَّهُمَّ أَعِنِّي عَلَى طَاعَتِكَ",
    translation: "Ey Alloh, Sening itoatingda menga yordam bergin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma a'inni 'ala ta'atika",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "Bolaning rizqini kengaytirish",
    arabic: "اللَّهُمَّ ارْزُقْ أَوْلَادِي رِزْقًا وَاسِعًا",
    translation: "Ey Alloh, bolalarimga keng rizq bergin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma arzuq awladi rizqan wasi'an",
      category: DuaCategories.FAMILY
  ),
  Dua(
    name: "Ko'rishni yaxshilash uchun",
    arabic: "اللَّهُمَّ اجْعَلْ بَصَرِي نُورًا",
    translation: "Ey Alloh, ko'zimni nur qilgin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma aj'al basari nuran",
      category: DuaCategories.SUNNAH_DUAS
  ),
  Dua(
    name: "Quloqlarni himoya qilish",
    arabic: "اللَّهُمَّ احْفَظْ سَمْعِي مِنَ الْحَرَامِ",
    translation: "Ey Alloh, quloqlarimni harom narsalardan saqla.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma ihfaz sam'i minal haram",
      category: DuaCategories.SUNNAH_DUAS
  ),
  Dua(
    name: "Payg'ambarga (SAV) salovat",
    arabic: "اللَّهُمَّ صَلِّ عَلَى سَيِّدِنَا مُحَمَّدٍ",
    translation: "Ey Alloh, bizning sayyidimiz Muhammadga salovat ayla.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma salli ala sayyidina Muhammad",
      category: DuaCategories.SALAWAT
  ),
  Dua(
    name: "Iymonni mustahkamlash",
    arabic: "اللَّهُمَّ زِدْنِي إِيمَانًا وَتَقْوَى",
    translation: "Ey Alloh, iymonimni va taqvoni ziyoda qil.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma zidni imanan wa taqwa",
      category: DuaCategories.DHIKR_FOR_ALL_TIMES
  ),
  Dua(
    name: "Maqtov so'rash",
    arabic: "اللَّهُمَّ اجْعَلْنِي مِمَّنْ يُثْنِي عَلَيْهِ بِالْخَيْرِ",
    translation: "Ey Alloh, meni yaxshi sifatlar bilan eslab turuvchi qilgin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma aj'alni mimman yuthna 'alayhi bilkhayr",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "Qalbni yumshatish uchun",
    arabic: "اللَّهُمَّ لَيِّنْ قَلْبِي",
    translation: "Ey Alloh, qalbimni yumshat.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma layyin qalbi",
      category: DuaCategories.ISTIGHFAR
  ),
  Dua(
    name: "Sabrlik so'rash",
    arabic: "اللَّهُمَّ اجْعَلْنِي مِنَ الصَّابِرِينَ",
    translation: "Ey Alloh, meni sabrli bandalaringdan qilgin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma aj'alni minas sabirin",
      category: DuaCategories.SUNNAH_DUAS
  ),
  Dua(
    name: "Rizq so'rash",
    arabic: "اللَّهُمَّ ارْزُقْنِي رِزْقًا وَاسِعًا",
    translation: "Ey Alloh, menga keng rizq bergin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma arzuqni rizqan wasi'an",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "Iymonni kuchaytirish uchun",
    arabic: "اللَّهُمَّ زِدْنِي إِيمَانًا وَتَوْكِيلًا",
    translation: "Ey Alloh, iymonimni va tavakkulni ziyoda qil.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma zidni imanan wa tawakulan",
      category: DuaCategories.DHIKR_FOR_ALL_TIMES
  ),
  Dua(
    name: "Qalbni tozalash uchun",
    arabic: "اللَّهُمَّ طَهِّرْ قَلْبِي مِنَ النِّفَاقِ",
    translation: "Ey Alloh, qalbimni nifoqdan pokla.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma tahhir qalbi minan nifaq",
      category: DuaCategories.ISTIGHFAR
  ),
  Dua(
    name: "Ko'rib tushgan yomon tushlardan himoya so'rash",
    arabic:
        "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ شَرِّ مَا رَأَيْتُ فِي مَنَامِي",
    translation: "Ey Alloh, tushimda ko'rgan yomonlikdan panoh so'rayman.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma inni a'udhu bika min sharri ma ra'aytu fi manami",
      category: DuaCategories.ISTIGHFAR
  ),
  Dua(
    name: "Masjidga kirishda",
    arabic: "اللَّهُمَّ افْتَحْ لِي أَبْوَابَ رَحْمَتِكَ",
    translation: "Ey Alloh, men uchun rahmat eshiklarini och.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma iftah li abwaba rahmatika",
      category: DuaCategories.MOSQUE
  ),
  Dua(
    name: "Mag'firat so'rash",
    arabic: "اللَّهُمَّ اغْفِرْ لِي وَارْحَمْنِي",
    translation: "Ey Alloh, meni kechir va menga rahm qil.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma aghfir li warhamni",
      category: DuaCategories.ISTIGHFAR
  ),
  Dua(
    name: "Yangi kun uchun shukr",
    arabic: "اللَّهُمَّ مَا أَصْبَحَ بِي مِنْ نِعْمَةٍ",
    translation:
        "Ey Alloh, menga yetkazgan ne'matlaring uchun Senga shukr qilaman.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma ma asbaha bi min ni'matin",
      category: DuaCategories.DHIKR_FOR_ALL_TIMES
  ),
  Dua(
    name: "Uyqudan oldin",
    arabic: "اللَّهُمَّ بِاسْمِكَ أَمُوتُ وَأَحْيَا",
    translation: "Ey Alloh, Sening isming bilan o'laman va tirilaman.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma bismika amutu wa ahya",
      category: DuaCategories.SLEEP
  ),
  Dua(
    name: "Oila uchun duo",
    arabic: "رَبِّ اجْعَلْنِي وَأَهْلِي مِنَ الصَّالِحِينَ",
    translation: "Parvardigorim, meni va oilamni solihlardan qilgin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Rabbij'alni wa ahli minassalihin",
      category: DuaCategories.FAMILY
  ),
  Dua(
    name: "Ko'rishni yaxshilash uchun",
    arabic: "اللَّهُمَّ اجْعَلْ بَصَرِي نُورًا",
    translation: "Ey Alloh, ko'zimni nur qilgin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma aj'al basari nuran",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "Dushmanlarga qarshi panoh so'rash",
    arabic: "اللَّهُمَّ اكْفِنِي شَرَّهُمْ",
    translation: "Ey Alloh, meni ulardan saqla.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma ikfini sharrahum",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "O'rganish va ilm uchun duo",
    arabic: "اللَّهُمَّ زِدْنِي عِلْمًا",
    translation: "Ey Alloh, ilmimni ziyoda qil.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma zidni 'ilma",
      category: DuaCategories.QURANIC_DUAS
  ),
  Dua(
    name: "Sog'liq uchun duo",
    arabic: "اللَّهُمَّ اشْفِنِي وَعَافِنِي",
    translation: "Ey Alloh, meni davola va sog'ligimni yaxshilagin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma ishfini wa 'afini",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "Sabrli bo'lish uchun",
    arabic: "اللَّهُمَّ اجْعَلْنِي مِنَ الصَّابِرِينَ",
    translation: "Ey Alloh, meni sabrli bandalaringdan qilgin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma aj'alni minas sabirin",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "Sog'liqni saqlash uchun duo",
    arabic: "اللَّهُمَّ احْفَظْنِي مِنَ الْأَمْرَاضِ",
    translation: "Ey Alloh, meni kasalliklardan saqla.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma ihfazni minal amrad",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "Yomonliklardan himoya so'rash",
    arabic: "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الشَّرِّ كُلِّهِ",
    translation: "Ey Alloh, men Sendan har qanday yomonlikdan panoh so'rayman.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma inni a'udhu bika minash sharri kullihi",
      category: DuaCategories.ISTIGHFAR
  ),
  Dua(
    name: "Ajal yaqinlashganida",
    arabic: "اللَّهُمَّ اجْعَلْ خَاتِمَتِي خَيْرًا",
    translation: "Ey Alloh, oxirimni xayrli qilgin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma aj'al khatimati khayran",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "Maqtov so'rash",
    arabic: "اللَّهُمَّ اجْعَلْنِي مِمَّنْ يُثْنِي عَلَيْهِ بِالْخَيْرِ",
    translation: "Ey Alloh, meni yaxshi sifatlar bilan eslab turuvchi qilgin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma aj'alni mimman yuthna 'alayhi bilkhayr",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "Ilm va hikmat so'rash",
    arabic: "اللَّهُمَّ ارْزُقْنِي حِكْمَةً وَعِلْمًا نَافِعًا",
    translation: "Ey Alloh, menga hikmat va foydali ilm ato et.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma arzuqni hikmatan wa 'ilman nafi'an",
      category: DuaCategories.DHIKR_FOR_ALL_TIMES
  ),
  Dua(
    name: "To'g'ri yo'l so'rash",
    arabic: "اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ",
    translation: "Bizni to'g'ri yo'lga boshlagin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Ihdinas siratal mustaqim",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "Dushmanlardan himoya so'rash",
    arabic: "اللَّهُمَّ احْفَظْنِي مِنْ شَرِّ أَعْدَائِي",
    translation: "Ey Alloh, meni dushmanlarimning yomonligidan saqla.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma ihfazni min sharri a'da'i",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "Qalbni harom narsalardan saqlash",
    arabic: "اللَّهُمَّ طَهِّرْ قَلْبِي مِنَ النِّفَاقِ",
    translation: "Ey Alloh, qalbimni nifoqdan pokla.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma tahhir qalbi minan nifaq",
      category: DuaCategories.ISTIGHFAR
  ),
  Dua(
    name: "Allohning yo'lida jon fido qilish uchun",
    arabic: "اللَّهُمَّ اجْعَلْنِي مِنَ الشُّهَدَاءِ",
    translation: "Ey Alloh, meni shahidlar qatoriga qo'sh.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma aj'alni minash shuhada'",
      category: DuaCategories.OTHER
  ),
  Dua(
    name: "Yomon ko'zdan saqlanish",
    arabic: "أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ",
    translation:
        "Allohning mukammal so'zlari bilan U yaratgan yomonlikdan panoh so'rayman.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "A'udhu bikalimatillahi tammati min sharri ma khalaq",
      category: DuaCategories.DHIKR_FOR_ALL_TIMES
  ),
  Dua(
    name: "Rizqni kengaytirish uchun",
    arabic: "اللَّهُمَّ ارْزُقْنِي حَلَالًا وَوَاسِعًا",
    translation: "Ey Alloh, menga halol va keng rizq bergin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma arzuqni halalan wa wasian",
      category: DuaCategories.DHIKR_FOR_ALL_TIMES
  ),
  Dua(
    name: "Bolalar uchun duo",
    arabic: "اللَّهُمَّ اجْعَلْ أَوْلَادِي مِنَ الْمُتَّقِينَ",
    translation: "Ey Alloh, bolalarimni taqvodorlardan qilgin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma aj'al awladi minal muttaqin",
      category: DuaCategories.FAMILY
  ),
  Dua(
    name: "Duo qabul bo'lishi uchun",
    arabic: "اللَّهُمَّ إِنِّي أَسْأَلُكَ قَبُولَ دُعَائِي",
    translation: "Ey Alloh, duolarimni qabul qilishingni so'rayman.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma inni asaluka qabula du'ai",
      category: DuaCategories.DHIKR_FOR_ALL_TIMES
  ),
  Dua(
    name: "Rizq so'rash",
    arabic: "اللَّهُمَّ ارْزُقْنِي رِزْقًا وَاسِعًا",
    translation: "Ey Alloh, menga keng rizq bergin.",
    author: "Payg'ambar Muhammad (SAV)",
    spelling: "Allahumma arzuqni rizqan wasi'an",
      category: DuaCategories.OTHER
  ),

  Dua(
      category: DuaCategories.ISTIGHFAR,
      name: 'Yovuz shaytonlar makrini qaytarish uchun nima deyiladi?',
      author: 'Ahmad va Ibn Sunniy',
      spelling:
          'Aʼuuzu bi-kalimaatillaahit- taammaati, allatiy laa yujaavizuhunna barrun va laa faajirun min sharri maa xolaqo, va baroa va zaroa, va min sharri maa yanzilu minas- samaai, va min sharri maa yaʼruju fiyhaa, va min sharri maa zaroa fil-ardi, va min sharri maa yaxruju minhaa, va min sharri fitanil-layli van-nahaar, va min sharri kulli tooriqin illaa tooriqon yatruqu bi-xoyrin yaa Rohmaan',
      arabic:
          'أَعُوذُ بِكَلِمَاتِ اللّٰهِ التَّامَّاتِ الَّتِي لاَ يُجَاوِزُهُنَّ بَرٌّ وَلاَ فَاجِرٌ مِنْ شَرِّ مَا خَلَقَ، وَبَرَأَ وَذَرَأَ، وَمِنْ شَرِّ مَا يَنْزِلُ مِنَ السَّمَاءِ، وَمِنْ شَرِّ مَا يَعْرُجُ فِيْهَا، وَمِنْ شَرِّ مَا ذَرَأَ فِي الأَرْضِ، وَمِنْ شَرِّ مَا يَخْرُجُ مِنْهَا، وَمِنْ شَرِّ فِتَنِ اللَّيْلِ وَالنَّهَارِ، وَمِنْ شَرِّ كُلِّ طَارِقٍ إِلاَّ طَارِقاً يَطْرُقُ بِخَيْرٍ، يَا رَحْمانُ',
      translation:
          'Yaxshi odam ham, yomon odam ham hatlab oʻtib keta olmaydigan Allohning mukammal kalimalari bilan U yaratgan, taratgan va vujudga keltirgan narsalarning yomonligidan pano so’rayman. Osmondan tushadigan narsalarning yomonligidan va unga koʻtariluvchi narsalarning yomonligidan, yerda tarqatgan-oʻstirgan narsalarining yomonligidan va undan chiqadigan narsalarning yomonligidan, kecha-kunduz fitnalarining yomonligidan va har bir tunda keluvchining yomonligidan (panoh so’rayman). Bundan faqat yaxshilik bilan keluvchi mustasno, ey Rahmon!'),
  Dua(
      category: DuaCategories.SLEEP,
      name: 'Uyqudan turganda',
      author: 'Buxoriy va Muslim',
      spelling:
          'Alhamdu lillaahillaziy ahyaanaa baʼda maa amaatanaa va ilayhin-nushuur',
      arabic:
          'الْحَـمْدُ لِلّٰهِ الَّـذِي أَحْيَـانَا بَعْدَ مَـا أَمَـاتَـنَا وإِلَـيْـهِ النُّشُوْرُ',
      translation:
          'Bizga oʻldirgandan soʻng (yana) hayot bergan Allohga hamd boʻlsin. Qaytish ungadir!')
];
