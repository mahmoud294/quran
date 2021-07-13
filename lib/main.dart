import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/Screens/Home.dart';
import 'package:quran/providers/SourProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SourProvider(),),
      ],
      child: MaterialApp(
        title: 'Quran',
        theme: ThemeData(
          fontFamily: "Reem",
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen()
      ),
    );
  }
}

