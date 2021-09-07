import 'package:ch4_starter_exercise/pages/right_drawer.dart';
import 'package:flutter/material.dart';

class DrawerRightSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Right'),
      ),
      // drawer: LeftDrawer(),
      endDrawer: RightDrawer(),
      body: SafeArea(
        child: Center(
          child: Text('Select one option on the right'),
        ),
      ),
    );
  }
}
