import 'package:flutter/material.dart';

class JouzGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 9),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.5,
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 2),
      itemCount: 30,
      itemBuilder: (context, index) => Card(
        elevation: 5,
        borderOnForeground: true,
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: GridTile(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: GridTileBar(
                title: Text(
                  "الجزء ${index + 1}",
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
