import 'package:ch4_starter_exercise/pages/left_drawer.dart';
import 'package:flutter/material.dart';

class DrawerLeftSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer left'),
      ),
      drawer: LeftDrawer(),
      body: SafeArea(
        child: Center(
          child: Text('Select one option on the left'),
        ),
      ),
    );
  }
}
