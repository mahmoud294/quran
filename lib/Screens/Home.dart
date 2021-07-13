import 'package:flutter/material.dart';
import 'package:quran/Widgets/JouzScreen/JouzGridView.dart';
import 'package:quran/Widgets/SourScreen/SourWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(centerTitle: true,title: Text("القرأن الكريم"),
          bottom: TabBar(
            automaticIndicatorColorAdjustment: true,labelStyle: TextStyle(fontSize: 25,fontFamily: 'Reem'),
            tabs: [
              Tab(
                text: "جزء",
              ),
              Tab( 
                text: "سور",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [JouzGrid(),SourWidget()],
        ),
      ),
    );
  }
}
