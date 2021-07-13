import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quran/Screens/AyatScreen.dart';
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
        ChangeNotifierProvider(
          create: (_) => SourProvider(),
        ),        
        
      ],
      child: MaterialApp(
          title: 'Quran',
          localizationsDelegates: [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('ar', 'EG'),
          ],
          locale: Locale('ar', 'EG'),
          theme: ThemeData(
            fontFamily: 'Tajawal',

            // is not restarted.
            // primarySwatch: Colors.blue,
            primaryColor: Colors.cyan[700],
            accentColor: Colors.lime[300]
          ),
          home: HomeScreen(),routes: {AyatScreen.routeName:(_)=>AyatScreen()},),
    );
  }
}
