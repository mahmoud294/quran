import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/Screens/AyatScreen.dart';
import 'package:quran/modal/AllSour.dart';
import 'package:quran/providers/SourProvider.dart';

class SourGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AllSour>(context);
    return InkWell(
      onTap: () {
        Provider.of<SourProvider>(context, listen: false)
            .getAyat(data.number)
            .then(
              (value) => Navigator.of(context).pushNamed(AyatScreen.routeName),
            );
      },
      child: Card(
        elevation: 5,
        borderOnForeground: true,
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: GridTile(
            footer: Container(
              margin: EdgeInsets.only(top: 19),
              child: data.revelationType == "Meccan"
                  ? Text("مكيه")
                  : Text("مدنية"),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: GridTileBar(
                subtitle: Text(
                  data.englishName,
                  style: TextStyle(color: Colors.black),
                ),
                title: Text(
                  data.name,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
