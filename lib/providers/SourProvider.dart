import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:quran/modal/AllSour.dart';
import 'package:quran/modal/ayat.dart';
import 'package:http/http.dart' as http;
import 'package:quran/modal/tafseerModel.dart';

class SourProvider with ChangeNotifier {
  List<AllSour> allSourList = [
    AllSour(
        number: 1,
        name: "سُورَةُ ٱلْفَاتِحَةِ",
        englishName: "Al-Faatiha",
        englishNameTranslation: "The Opening",
        numberOfAyahs: 7,
        revelationType: "Meccan"),
    AllSour(
        number: 2,
        name: "سُورَةُ البَقَرَةِ",
        englishName: "Al-Baqara",
        englishNameTranslation: "The Cow",
        numberOfAyahs: 286,
        revelationType: "Medinan"),
    AllSour(
        number: 3,
        name: "سُورَةُ آلِ عِمۡرَانَ",
        englishName: "Aal-i-Imraan",
        englishNameTranslation: "The Family of Imraan",
        numberOfAyahs: 200,
        revelationType: "Medinan"),
    AllSour(
        number: 4,
        name: "سُورَةُ النِّسَاءِ",
        englishName: "An-Nisaa",
        englishNameTranslation: "The Women",
        numberOfAyahs: 176,
        revelationType: "Medinan"),
    AllSour(
        number: 5,
        name: "سُورَةُ المَائـِدَةِ",
        englishName: "Al-Maaida",
        englishNameTranslation: "The Table",
        numberOfAyahs: 120,
        revelationType: "Medinan"),
    AllSour(
        number: 6,
        name: "سُورَةُ الأَنۡعَامِ",
        englishName: "Al-An'aam",
        englishNameTranslation: "The Cattle",
        numberOfAyahs: 165,
        revelationType: "Meccan"),
    AllSour(
        number: 7,
        name: "سُورَةُ الأَعۡرَافِ",
        englishName: "Al-A'raaf",
        englishNameTranslation: "The Heights",
        numberOfAyahs: 206,
        revelationType: "Meccan"),
    AllSour(
        number: 8,
        name: "سُورَةُ الأَنفَالِ",
        englishName: "Al-Anfaal",
        englishNameTranslation: "The Spoils of War",
        numberOfAyahs: 75,
        revelationType: "Medinan"),
    AllSour(
        number: 9,
        name: "سُورَةُ التَّوۡبَةِ",
        englishName: "At-Tawba",
        englishNameTranslation: "The Repentance",
        numberOfAyahs: 129,
        revelationType: "Medinan"),
    AllSour(
        number: 10,
        name: "سُورَةُ يُونُسَ",
        englishName: "Yunus",
        englishNameTranslation: "Jonas",
        numberOfAyahs: 109,
        revelationType: "Meccan"),
    AllSour(
        number: 11,
        name: "سُورَةُ هُودٍ",
        englishName: "Hud",
        englishNameTranslation: "Hud",
        numberOfAyahs: 123,
        revelationType: "Meccan"),
    AllSour(
        number: 12,
        name: "سُورَةُ يُوسُفَ",
        englishName: "Yusuf",
        englishNameTranslation: "Joseph",
        numberOfAyahs: 111,
        revelationType: "Meccan"),
    AllSour(
        number: 13,
        name: "سُورَةُ الرَّعۡدِ",
        englishName: "Ar-Ra'd",
        englishNameTranslation: "The Thunder",
        numberOfAyahs: 43,
        revelationType: "Medinan"),
    AllSour(
        number: 14,
        name: "سُورَةُ إِبۡرَاهِيمَ",
        englishName: "Ibrahim",
        englishNameTranslation: "Abraham",
        numberOfAyahs: 52,
        revelationType: "Meccan"),
    AllSour(
        number: 15,
        name: "سُورَةُ الحِجۡرِ",
        englishName: "Al-Hijr",
        englishNameTranslation: "The Rock",
        numberOfAyahs: 99,
        revelationType: "Meccan"),
    AllSour(
        number: 16,
        name: "سُورَةُ النَّحۡلِ",
        englishName: "An-Nahl",
        englishNameTranslation: "The Bee",
        numberOfAyahs: 128,
        revelationType: "Meccan"),
    AllSour(
        number: 17,
        name: "سُورَةُ الإِسۡرَاءِ",
        englishName: "Al-Israa",
        englishNameTranslation: "The Night Journey",
        numberOfAyahs: 111,
        revelationType: "Meccan"),
    AllSour(
        number: 18,
        name: "سُورَةُ الكَهۡفِ",
        englishName: "Al-Kahf",
        englishNameTranslation: "The Cave",
        numberOfAyahs: 110,
        revelationType: "Meccan"),
    AllSour(
        number: 19,
        name: "سُورَةُ مَرۡيَمَ",
        englishName: "Maryam",
        englishNameTranslation: "Mary",
        numberOfAyahs: 98,
        revelationType: "Meccan"),
    AllSour(
        number: 20,
        name: "سُورَةُ طه",
        englishName: "Taa-Haa",
        englishNameTranslation: "Taa-Haa",
        numberOfAyahs: 135,
        revelationType: "Meccan"),
    AllSour(
        number: 21,
        name: "سُورَةُ الأَنبِيَاءِ",
        englishName: "Al-Anbiyaa",
        englishNameTranslation: "The Prophets",
        numberOfAyahs: 112,
        revelationType: "Meccan"),
    AllSour(
        number: 22,
        name: "سُورَةُ الحَجِّ",
        englishName: "Al-Hajj",
        englishNameTranslation: "The Pilgrimage",
        numberOfAyahs: 78,
        revelationType: "Medinan"),
    AllSour(
        number: 23,
        name: "سُورَةُ المُؤۡمِنُونَ",
        englishName: "Al-Muminoon",
        englishNameTranslation: "The Believers",
        numberOfAyahs: 118,
        revelationType: "Meccan"),
    AllSour(
        number: 24,
        name: "سُورَةُ النُّورِ",
        englishName: "An-Noor",
        englishNameTranslation: "The Light",
        numberOfAyahs: 64,
        revelationType: "Medinan"),
    AllSour(
        number: 25,
        name: "سُورَةُ الفُرۡقَانِ",
        englishName: "Al-Furqaan",
        englishNameTranslation: "The Criterion",
        numberOfAyahs: 77,
        revelationType: "Meccan"),
    AllSour(
        number: 26,
        name: "سُورَةُ الشُّعَرَاءِ",
        englishName: "Ash-Shu'araa",
        englishNameTranslation: "The Poets",
        numberOfAyahs: 227,
        revelationType: "Meccan"),
    AllSour(
        number: 27,
        name: "سُورَةُ النَّمۡلِ",
        englishName: "An-Naml",
        englishNameTranslation: "The Ant",
        numberOfAyahs: 93,
        revelationType: "Meccan"),
    AllSour(
        number: 28,
        name: "سُورَةُ القَصَصِ",
        englishName: "Al-Qasas",
        englishNameTranslation: "The Stories",
        numberOfAyahs: 88,
        revelationType: "Meccan"),
    AllSour(
        number: 29,
        name: "سُورَةُ العَنكَبُوتِ",
        englishName: "Al-Ankaboot",
        englishNameTranslation: "The Spider",
        numberOfAyahs: 69,
        revelationType: "Meccan"),
    AllSour(
        number: 30,
        name: "سُورَةُ الرُّومِ",
        englishName: "Ar-Room",
        englishNameTranslation: "The Romans",
        numberOfAyahs: 60,
        revelationType: "Meccan"),
    AllSour(
        number: 31,
        name: "سُورَةُ لُقۡمَانَ",
        englishName: "Luqman",
        englishNameTranslation: "Luqman",
        numberOfAyahs: 34,
        revelationType: "Meccan"),
    AllSour(
        number: 32,
        name: "سُورَةُ السَّجۡدَةِ",
        englishName: "As-Sajda",
        englishNameTranslation: "The Prostration",
        numberOfAyahs: 30,
        revelationType: "Meccan"),
    AllSour(
        number: 33,
        name: "سُورَةُ الأَحۡزَابِ",
        englishName: "Al-Ahzaab",
        englishNameTranslation: "The Clans",
        numberOfAyahs: 73,
        revelationType: "Medinan"),
    AllSour(
        number: 34,
        name: "سُورَةُ سَبَإٍ",
        englishName: "Saba",
        englishNameTranslation: "Sheba",
        numberOfAyahs: 54,
        revelationType: "Meccan"),
    AllSour(
        number: 35,
        name: "سُورَةُ فَاطِرٍ",
        englishName: "Faatir",
        englishNameTranslation: "The Originator",
        numberOfAyahs: 45,
        revelationType: "Meccan"),
    AllSour(
        number: 36,
        name: "سُورَةُ يسٓ",
        englishName: "Yaseen",
        englishNameTranslation: "Yaseen",
        numberOfAyahs: 83,
        revelationType: "Meccan"),
    AllSour(
        number: 37,
        name: "سُورَةُ الصَّافَّاتِ",
        englishName: "As-Saaffaat",
        englishNameTranslation: "Those drawn up in Ranks",
        numberOfAyahs: 182,
        revelationType: "Meccan"),
    AllSour(
        number: 38,
        name: "سُورَةُ صٓ",
        englishName: "Saad",
        englishNameTranslation: "The letter Saad",
        numberOfAyahs: 88,
        revelationType: "Meccan"),
    AllSour(
        number: 39,
        name: "سُورَةُ الزُّمَرِ",
        englishName: "Az-Zumar",
        englishNameTranslation: "The Groups",
        numberOfAyahs: 75,
        revelationType: "Meccan"),
    AllSour(
        number: 40,
        name: "سُورَةُ غَافِرٍ",
        englishName: "Ghafir",
        englishNameTranslation: "The Forgiver",
        numberOfAyahs: 85,
        revelationType: "Meccan"),
    AllSour(
        number: 41,
        name: "سُورَةُ فُصِّلَتۡ",
        englishName: "Fussilat",
        englishNameTranslation: "Explained in detail",
        numberOfAyahs: 54,
        revelationType: "Meccan"),
    AllSour(
        number: 42,
        name: "سُورَةُ الشُّورَىٰ",
        englishName: "Ash-Shura",
        englishNameTranslation: "Consultation",
        numberOfAyahs: 53,
        revelationType: "Meccan"),
    AllSour(
        number: 43,
        name: "سُورَةُ الزُّخۡرُفِ",
        englishName: "Az-Zukhruf",
        englishNameTranslation: "Ornaments of gold",
        numberOfAyahs: 89,
        revelationType: "Meccan"),
    AllSour(
        number: 44,
        name: "سُورَةُ الدُّخَانِ",
        englishName: "Ad-Dukhaan",
        englishNameTranslation: "The Smoke",
        numberOfAyahs: 59,
        revelationType: "Meccan"),
    AllSour(
        number: 45,
        name: "سُورَةُ الجَاثِيَةِ",
        englishName: "Al-Jaathiya",
        englishNameTranslation: "Crouching",
        numberOfAyahs: 37,
        revelationType: "Meccan"),
    AllSour(
        number: 46,
        name: "سُورَةُ الأَحۡقَافِ",
        englishName: "Al-Ahqaf",
        englishNameTranslation: "The Dunes",
        numberOfAyahs: 35,
        revelationType: "Meccan"),
    AllSour(
        number: 47,
        name: "سُورَةُ مُحَمَّدٍ",
        englishName: "Muhammad",
        englishNameTranslation: "Muhammad",
        numberOfAyahs: 38,
        revelationType: "Medinan"),
    AllSour(
        number: 48,
        name: "سُورَةُ الفَتۡحِ",
        englishName: "Al-Fath",
        englishNameTranslation: "The Victory",
        numberOfAyahs: 29,
        revelationType: "Medinan"),
    AllSour(
        number: 49,
        name: "سُورَةُ الحُجُرَاتِ",
        englishName: "Al-Hujuraat",
        englishNameTranslation: "The Inner Apartments",
        numberOfAyahs: 18,
        revelationType: "Medinan"),
    AllSour(
        number: 50,
        name: "سُورَةُ قٓ",
        englishName: "Qaaf",
        englishNameTranslation: "The letter Qaaf",
        numberOfAyahs: 45,
        revelationType: "Meccan"),
    AllSour(
        number: 51,
        name: "سُورَةُ الذَّارِيَاتِ",
        englishName: "Adh-Dhaariyat",
        englishNameTranslation: "The Winnowing Winds",
        numberOfAyahs: 60,
        revelationType: "Meccan"),
    AllSour(
        number: 52,
        name: "سُورَةُ الطُّورِ",
        englishName: "At-Tur",
        englishNameTranslation: "The Mount",
        numberOfAyahs: 49,
        revelationType: "Meccan"),
    AllSour(
        number: 53,
        name: "سُورَةُ النَّجۡمِ",
        englishName: "An-Najm",
        englishNameTranslation: "The Star",
        numberOfAyahs: 62,
        revelationType: "Meccan"),
    AllSour(
        number: 54,
        name: "سُورَةُ القَمَرِ",
        englishName: "Al-Qamar",
        englishNameTranslation: "The Moon",
        numberOfAyahs: 55,
        revelationType: "Meccan"),
    AllSour(
        number: 55,
        name: "سُورَةُ الرَّحۡمَٰن",
        englishName: "Ar-Rahmaan",
        englishNameTranslation: "The Beneficent",
        numberOfAyahs: 78,
        revelationType: "Medinan"),
    AllSour(
        number: 56,
        name: "سُورَةُ الوَاقِعَةِ",
        englishName: "Al-Waaqia",
        englishNameTranslation: "The Inevitable",
        numberOfAyahs: 96,
        revelationType: "Meccan"),
    AllSour(
        number: 57,
        name: "سُورَةُ الحَدِيدِ",
        englishName: "Al-Hadid",
        englishNameTranslation: "The Iron",
        numberOfAyahs: 29,
        revelationType: "Medinan"),
    AllSour(
        number: 58,
        name: "سُورَةُ المُجَادلَةِ",
        englishName: "Al-Mujaadila",
        englishNameTranslation: "The Pleading Woman",
        numberOfAyahs: 22,
        revelationType: "Medinan"),
    AllSour(
        number: 59,
        name: "سُورَةُ الحَشۡرِ",
        englishName: "Al-Hashr",
        englishNameTranslation: "The Exile",
        numberOfAyahs: 24,
        revelationType: "Medinan"),
    AllSour(
        number: 60,
        name: "سُورَةُ المُمۡتَحنَةِ",
        englishName: "Al-Mumtahana",
        englishNameTranslation: "She that is to be examined",
        numberOfAyahs: 13,
        revelationType: "Medinan"),
    AllSour(
        number: 61,
        name: "سُورَةُ الصَّفِّ",
        englishName: "As-Saff",
        englishNameTranslation: "The Ranks",
        numberOfAyahs: 14,
        revelationType: "Medinan"),
    AllSour(
        number: 62,
        name: "سُورَةُ الجُمُعَةِ",
        englishName: "Al-Jumu'a",
        englishNameTranslation: "Friday",
        numberOfAyahs: 11,
        revelationType: "Medinan"),
    AllSour(
        number: 63,
        name: "سُورَةُ المُنَافِقُونَ",
        englishName: "Al-Munaafiqoon",
        englishNameTranslation: "The Hypocrites",
        numberOfAyahs: 11,
        revelationType: "Medinan"),
    AllSour(
        number: 64,
        name: "سُورَةُ التَّغَابُنِ",
        englishName: "At-Taghaabun",
        englishNameTranslation: "Mutual Disillusion",
        numberOfAyahs: 18,
        revelationType: "Medinan"),
    AllSour(
        number: 65,
        name: "سُورَةُ الطَّلَاقِ",
        englishName: "At-Talaaq",
        englishNameTranslation: "Divorce",
        numberOfAyahs: 12,
        revelationType: "Medinan"),
    AllSour(
        number: 66,
        name: "سُورَةُ التَّحۡرِيمِ",
        englishName: "At-Tahrim",
        englishNameTranslation: "The Prohibition",
        numberOfAyahs: 12,
        revelationType: "Medinan"),
    AllSour(
        number: 67,
        name: "سُورَةُ المُلۡكِ",
        englishName: "Al-Mulk",
        englishNameTranslation: "The Sovereignty",
        numberOfAyahs: 30,
        revelationType: "Meccan"),
    AllSour(
        number: 68,
        name: "سُورَةُ القَلَمِ",
        englishName: "Al-Qalam",
        englishNameTranslation: "The Pen",
        numberOfAyahs: 52,
        revelationType: "Meccan"),
    AllSour(
        number: 69,
        name: "سُورَةُ الحَاقَّةِ",
        englishName: "Al-Haaqqa",
        englishNameTranslation: "The Reality",
        numberOfAyahs: 52,
        revelationType: "Meccan"),
    AllSour(
        number: 70,
        name: "سُورَةُ المَعَارِجِ",
        englishName: "Al-Ma'aarij",
        englishNameTranslation: "The Ascending Stairways",
        numberOfAyahs: 44,
        revelationType: "Meccan"),
    AllSour(
        number: 71,
        name: "سُورَةُ نُوحٍ",
        englishName: "Nooh",
        englishNameTranslation: "Noah",
        numberOfAyahs: 28,
        revelationType: "Meccan"),
    AllSour(
        number: 72,
        name: "سُورَةُ الجِنِّ",
        englishName: "Al-Jinn",
        englishNameTranslation: "The Jinn",
        numberOfAyahs: 28,
        revelationType: "Meccan"),
    AllSour(
        number: 73,
        name: "سُورَةُ المُزَّمِّلِ",
        englishName: "Al-Muzzammil",
        englishNameTranslation: "The Enshrouded One",
        numberOfAyahs: 20,
        revelationType: "Meccan"),
    AllSour(
        number: 74,
        name: "سُورَةُ المُدَّثِّرِ",
        englishName: "Al-Muddaththir",
        englishNameTranslation: "The Cloaked One",
        numberOfAyahs: 56,
        revelationType: "Meccan"),
    AllSour(
        number: 75,
        name: "سُورَةُ القِيَامَةِ",
        englishName: "Al-Qiyaama",
        englishNameTranslation: "The Resurrection",
        numberOfAyahs: 40,
        revelationType: "Meccan"),
    AllSour(
        number: 76,
        name: "سُورَةُ الإِنسَانِ",
        englishName: "Al-Insaan",
        englishNameTranslation: "Man",
        numberOfAyahs: 31,
        revelationType: "Medinan"),
    AllSour(
        number: 77,
        name: "سُورَةُ المُرۡسَلَاتِ",
        englishName: "Al-Mursalaat",
        englishNameTranslation: "The Emissaries",
        numberOfAyahs: 50,
        revelationType: "Meccan"),
    AllSour(
        number: 78,
        name: "سُورَةُ النَّبَإِ",
        englishName: "An-Naba",
        englishNameTranslation: "The Announcement",
        numberOfAyahs: 40,
        revelationType: "Meccan"),
    AllSour(
        number: 79,
        name: "سُورَةُ النَّازِعَاتِ",
        englishName: "An-Naazi'aat",
        englishNameTranslation: "Those who drag forth",
        numberOfAyahs: 46,
        revelationType: "Meccan"),
    AllSour(
        number: 80,
        name: "سُورَةُ عَبَسَ",
        englishName: "Abasa",
        englishNameTranslation: "He frowned",
        numberOfAyahs: 42,
        revelationType: "Meccan"),
    AllSour(
        number: 81,
        name: "سُورَةُ التَّكۡوِيرِ",
        englishName: "At-Takwir",
        englishNameTranslation: "The Overthrowing",
        numberOfAyahs: 29,
        revelationType: "Meccan"),
    AllSour(
        number: 82,
        name: "سُورَةُ الانفِطَارِ",
        englishName: "Al-Infitaar",
        englishNameTranslation: "The Cleaving",
        numberOfAyahs: 19,
        revelationType: "Meccan"),
    AllSour(
        number: 83,
        name: "سُورَةُ المُطَفِّفِينَ",
        englishName: "Al-Mutaffifin",
        englishNameTranslation: "Defrauding",
        numberOfAyahs: 36,
        revelationType: "Meccan"),
    AllSour(
        number: 84,
        name: "سُورَةُ الانشِقَاقِ",
        englishName: "Al-Inshiqaaq",
        englishNameTranslation: "The Splitting Open",
        numberOfAyahs: 25,
        revelationType: "Meccan"),
    AllSour(
        number: 85,
        name: "سُورَةُ البُرُوجِ",
        englishName: "Al-Burooj",
        englishNameTranslation: "The Constellations",
        numberOfAyahs: 22,
        revelationType: "Meccan"),
    AllSour(
        number: 86,
        name: "سُورَةُ الطَّارِقِ",
        englishName: "At-Taariq",
        englishNameTranslation: "The Morning Star",
        numberOfAyahs: 17,
        revelationType: "Meccan"),
    AllSour(
        number: 87,
        name: "سُورَةُ الأَعۡلَىٰ",
        englishName: "Al-A'laa",
        englishNameTranslation: "The Most High",
        numberOfAyahs: 19,
        revelationType: "Meccan"),
    AllSour(
        number: 88,
        name: "سُورَةُ الغَاشِيَةِ",
        englishName: "Al-Ghaashiya",
        englishNameTranslation: "The Overwhelming",
        numberOfAyahs: 26,
        revelationType: "Meccan"),
    AllSour(
        number: 89,
        name: "سُورَةُ الفَجۡرِ",
        englishName: "Al-Fajr",
        englishNameTranslation: "The Dawn",
        numberOfAyahs: 30,
        revelationType: "Meccan"),
    AllSour(
        number: 90,
        name: "سُورَةُ البَلَدِ",
        englishName: "Al-Balad",
        englishNameTranslation: "The City",
        numberOfAyahs: 20,
        revelationType: "Meccan"),
    AllSour(
        number: 91,
        name: "سُورَةُ الشَّمۡسِ",
        englishName: "Ash-Shams",
        englishNameTranslation: "The Sun",
        numberOfAyahs: 15,
        revelationType: "Meccan"),
    AllSour(
        number: 92,
        name: "سُورَةُ اللَّيۡلِ",
        englishName: "Al-Lail",
        englishNameTranslation: "The Night",
        numberOfAyahs: 21,
        revelationType: "Meccan"),
    AllSour(
        number: 93,
        name: "سُورَةُ الضُّحَىٰ",
        englishName: "Ad-Dhuhaa",
        englishNameTranslation: "The Morning Hours",
        numberOfAyahs: 11,
        revelationType: "Meccan"),
    AllSour(
        number: 94,
        name: "سُورَةُ الشَّرۡحِ",
        englishName: "Ash-Sharh",
        englishNameTranslation: "The Consolation",
        numberOfAyahs: 8,
        revelationType: "Meccan"),
    AllSour(
        number: 95,
        name: "سُورَةُ التِّينِ",
        englishName: "At-Tin",
        englishNameTranslation: "The Fig",
        numberOfAyahs: 8,
        revelationType: "Meccan"),
    AllSour(
        number: 96,
        name: "سُورَةُ العَلَقِ",
        englishName: "Al-Alaq",
        englishNameTranslation: "The Clot",
        numberOfAyahs: 19,
        revelationType: "Meccan"),
    AllSour(
        number: 97,
        name: "سُورَةُ القَدۡرِ",
        englishName: "Al-Qadr",
        englishNameTranslation: "The Power, Fate",
        numberOfAyahs: 5,
        revelationType: "Meccan"),
    AllSour(
        number: 98,
        name: "سُورَةُ البَيِّنَةِ",
        englishName: "Al-Bayyina",
        englishNameTranslation: "The Evidence",
        numberOfAyahs: 8,
        revelationType: "Medinan"),
    AllSour(
        number: 99,
        name: "سُورَةُ الزَّلۡزَلَةِ",
        englishName: "Az-Zalzala",
        englishNameTranslation: "The Earthquake",
        numberOfAyahs: 8,
        revelationType: "Medinan"),
    AllSour(
        number: 100,
        name: "سُورَةُ العَادِيَاتِ",
        englishName: "Al-Aadiyaat",
        englishNameTranslation: "The Chargers",
        numberOfAyahs: 11,
        revelationType: "Meccan"),
    AllSour(
        number: 101,
        name: "سُورَةُ القَارِعَةِ",
        englishName: "Al-Qaari'a",
        englishNameTranslation: "The Calamity",
        numberOfAyahs: 11,
        revelationType: "Meccan"),
    AllSour(
        number: 102,
        name: "سُورَةُ التَّكَاثُرِ",
        englishName: "At-Takaathur",
        englishNameTranslation: "Competition",
        numberOfAyahs: 8,
        revelationType: "Meccan"),
    AllSour(
        number: 103,
        name: "سُورَةُ العَصۡرِ",
        englishName: "Al-Asr",
        englishNameTranslation: "The Declining Day, Epoch",
        numberOfAyahs: 3,
        revelationType: "Meccan"),
    AllSour(
        number: 104,
        name: "سُورَةُ الهُمَزَةِ",
        englishName: "Al-Humaza",
        englishNameTranslation: "The Traducer",
        numberOfAyahs: 9,
        revelationType: "Meccan"),
    AllSour(
        number: 105,
        name: "سُورَةُ الفِيلِ",
        englishName: "Al-Fil",
        englishNameTranslation: "The Elephant",
        numberOfAyahs: 5,
        revelationType: "Meccan"),
    AllSour(
        number: 106,
        name: "سُورَةُ قُرَيۡشٍ",
        englishName: "Quraish",
        englishNameTranslation: "Quraysh",
        numberOfAyahs: 4,
        revelationType: "Meccan"),
    AllSour(
        number: 107,
        name: "سُورَةُ المَاعُونِ",
        englishName: "Al-Maa'un",
        englishNameTranslation: "Almsgiving",
        numberOfAyahs: 7,
        revelationType: "Meccan"),
    AllSour(
        number: 108,
        name: "سُورَةُ الكَوۡثَرِ",
        englishName: "Al-Kawthar",
        englishNameTranslation: "Abundance",
        numberOfAyahs: 3,
        revelationType: "Meccan"),
    AllSour(
        number: 109,
        name: "سُورَةُ الكَافِرُونَ",
        englishName: "Al-Kaafiroon",
        englishNameTranslation: "The Disbelievers",
        numberOfAyahs: 6,
        revelationType: "Meccan"),
    AllSour(
        number: 110,
        name: "سُورَةُ النَّصۡرِ",
        englishName: "An-Nasr",
        englishNameTranslation: "Divine Support",
        numberOfAyahs: 3,
        revelationType: "Medinan"),
    AllSour(
        number: 111,
        name: "سُورَةُ المَسَدِ",
        englishName: "Al-Masad",
        englishNameTranslation: "The Palm Fibre",
        numberOfAyahs: 5,
        revelationType: "Meccan"),
    AllSour(
        number: 112,
        name: "سُورَةُ الإِخۡلَاصِ",
        englishName: "Al-Ikhlaas",
        englishNameTranslation: "Sincerity",
        numberOfAyahs: 4,
        revelationType: "Meccan"),
    AllSour(
        number: 113,
        name: "سُورَةُ الفَلَقِ",
        englishName: "Al-Falaq",
        englishNameTranslation: "The Dawn",
        numberOfAyahs: 5,
        revelationType: "Meccan"),
    AllSour(
        number: 114,
        name: "سُورَةُ النَّاسِ",
        englishName: "An-Naas",
        englishNameTranslation: "Mankind",
        numberOfAyahs: 6,
        revelationType: "Meccan"),
  ];

  late String selectedSouraName;
  List<Tafseer> tafseerList = [];
  List<AyatModel> ayatList = [];
  Future<void> getAyat(int souraNumber) async {
    // final Uri url =
    //     Uri.parse("https://api.alquran.cloud/v1/surah/$souraNumber");
    try {
      // final response = await http.get(url);
      final response = await rootBundle.loadString('assets/data/quran.json');
      final tafseerResponse =
          await rootBundle.loadString('assets/data/tafseer.json');
      final responseData = json.decode(response);
      final responseDatatafseer = json.decode(tafseerResponse);
      final dd = responseData["data"] as Map<String, dynamic>;
      final ddTafseer = responseDatatafseer["data"] as Map<String, dynamic>;
      final extractedData = dd["surahs"] as List<dynamic>;
      final extractedDataTafseer = ddTafseer["surahs"] as List<dynamic>;
      
      extractedData.forEach((element) {
        if (element["number"] != souraNumber) {
        } else {
          selectedSouraName = element["name"];
          final List<AyatModel> data = [];
          final ayatListData = element["ayahs"] as List<dynamic>;
          ayatListData.forEach((aya) {
            data.add(
              AyatModel(
                  hizbQuarter: aya["hizbQuarter"],
                  juz: aya["juz"],
                  manzil: aya["manzil"],
                  number: aya["number"],
                  numberInSurah: aya["numberInSurah"],
                  page: aya["page"],
                  ruku: aya["ruku"],
                  sajda: aya["sajda"] == false ? false : true,
                  text: aya["text"]),
            );
          });
          
          ayatList = data;
        }
      });

      extractedDataTafseer.forEach((element) {
        if (element["number"] != souraNumber) {
        } else {
          selectedSouraName = element["name"];
          final List<Tafseer> dataTaf = [];
          final ayatListDataTafseer = element["ayahs"] as List<dynamic>;
          ayatListDataTafseer.forEach((aya) {
            dataTaf.add(
              Tafseer(ayasNumber: aya["number"], tafseer: aya["text"])
            );
          });
          
          tafseerList = dataTaf;
        }
      });

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
