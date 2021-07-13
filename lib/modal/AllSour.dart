import 'package:flutter/cupertino.dart';

class AllSour with ChangeNotifier{
  int number;
  String name;
  String englishName;
  String englishNameTranslation;
  int numberOfAyahs;
  String revelationType;
  AllSour(
      {required this.englishName,
      required this.englishNameTranslation,
      required this.name,
      required this.number,
      required this.numberOfAyahs,
      required this.revelationType});
}
