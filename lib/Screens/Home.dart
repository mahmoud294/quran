import 'package:flutter/material.dart';
import 'package:quran/Widgets/SourScreen/SourWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(centerTitle: true,title: Text("Quran Kareem القرأن الكريم"),
          bottom: TabBar(
            automaticIndicatorColorAdjustment: true,
            tabs: [
              Tab(
                text: "Jouz'",
              ),
              Tab(
                text: "Sura",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [SourWidget(),SourWidget()],
        ),
      ),
    );
  }
}
