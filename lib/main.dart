import 'package:ch4_starter_exercise/home.dart';
import 'package:ch4_starter_exercise/pages/about.dart';
import 'package:ch4_starter_exercise/pages/gratitude.dart';
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
        primarySwatch: Colors.lightGreen,
      ),
      home: Home(),
      routes: {
        '/about': (context) => About(),
        '/gratitude': (context) => Gratitude(),
      },
    );
  }
}
