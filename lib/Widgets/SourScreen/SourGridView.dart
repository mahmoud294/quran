import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/modal/AllSour.dart';

class SourGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AllSour>(context);
    return Card(
      elevation: 5,
      borderOnForeground: true,
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child:
            // ListTile(title: Text(data.name),subtitle: Text(data.englishName),trailing: Text(data.revelationType),leading: CircleAvatar(child: Text("${data.number}"),),),
            GridTile(footer: Container(margin: EdgeInsets.only(top: 19),child: Text(data.revelationType)),
          child: Container(margin: EdgeInsets.symmetric(vertical: 16),
            child: GridTileBar(
              leading: CircleAvatar(radius: 13,
                child: Container(margin: EdgeInsets.all(2),child: FittedBox(child: Text("${data.number}"))),
              ),
              subtitle: Text(data.englishName,style: TextStyle(color: Colors.black),),
              // trailing: Text(data.revelationType),
              title: Text(data.name,style: TextStyle(color: Colors.black,fontSize: 20),),
            ),
          ),
        ),
      ),
    );
  }
}
