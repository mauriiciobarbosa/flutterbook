import 'package:ch4_starter_exercise/pages/about.dart';
import 'package:ch4_starter_exercise/pages/gratitude.dart';
import 'package:ch4_starter_exercise/widgets/chapter_8_bottom_bar_navigation.dart';
import 'package:ch4_starter_exercise/widgets/chapter_8_hero_animation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightGreen,
      ),
      home: BottomNavigationBarSample(),
      routes: {
        '/about': (context) => About(),
        '/gratitude': (context) => Gratitude(),
      },
    );
  }
}
