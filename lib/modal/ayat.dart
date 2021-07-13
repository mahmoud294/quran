import 'package:flutter/cupertino.dart';

class AyatModel with ChangeNotifier {
  int number;
  String text;
  int numberInSurah;
  int juz;
  int manzil;
  int page;
  int ruku;
  int hizbQuarter;
  bool sajda;
  AyatModel(
      {required this.hizbQuarter,
      required this.juz,
      required this.manzil,
      required this.number,
      required this.numberInSurah,
      required this.page,
      required this.ruku,
      required this.sajda,
      required this.text});
}
