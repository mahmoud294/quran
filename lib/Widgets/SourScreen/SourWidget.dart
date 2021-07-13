import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/Widgets/SourScreen/SourGridView.dart';
import 'package:quran/providers/SourProvider.dart';

class SourWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SourProvider>(
      builder: (context, value, child) => GridView.builder(padding: EdgeInsets.symmetric(horizontal: 6,vertical: 9),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 1.5,
            crossAxisCount: 2, mainAxisSpacing: 4, crossAxisSpacing: 2),
        itemCount: value.allSourList.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: value.allSourList[index],
          child: SourGridItem(),
        ),
      ),
    );
  }
}
