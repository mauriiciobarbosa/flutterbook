import 'package:ch4_starter_exercise/pages/fly.dart';
import 'package:flutter/material.dart';

class HeroAnimationSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: InkWell(
            child: Hero(
              tag: 'format_paint',
              child: Icon(
                Icons.format_paint,
                color: Colors.lightGreen,
                size: 120,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Fly()),
              );
            },
          ),
        ),
      ),
    );
  }
}
