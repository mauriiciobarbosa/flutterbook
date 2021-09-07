import 'package:ch4_starter_exercise/pages/menu_list_tile_widget.dart';
import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Sandy Smith',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            accountEmail: Text(
              'sandy.smith@gmail.com',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            currentAccountPicture: Icon(
              Icons.face,
              size: 48,
              color: Colors.black,
            ),
            otherAccountsPictures: [
              Icon(Icons.bookmark_border, color: Colors.black)
            ],
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home_top_mountain.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          MenuListTile(),
        ],
      ),
    );
  }
}
