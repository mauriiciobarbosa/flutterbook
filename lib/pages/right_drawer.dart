import 'package:ch4_starter_exercise/pages/menu_list_tile_widget.dart';
import 'package:flutter/material.dart';

class RightDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Icon(Icons.face, size: 128, color: Colors.white54),
            decoration: BoxDecoration(color: Colors.lightGreen),
          ),
          MenuListTile(),
        ],
      ),
    );
  }
}
