import 'package:ch4_starter_exercise/pages/bottom_bar_page.dart';
import 'package:flutter/material.dart';

class MenuListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.cake),
          title: Text('Birthdays'),
          onTap: () => _navigateTo(
            context,
            'Birthdays',
            BottomBarPage(icon: Icons.cake, color: Colors.orange),
          ),
        ),
        ListTile(
          leading: Icon(Icons.sentiment_satisfied),
          title: Text('Gratitude'),
          onTap: () => _navigateTo(
            context,
            'Gratitude',
            BottomBarPage(icon: Icons.sentiment_satisfied, color: Colors.green),
          ),
        ),
        ListTile(
          leading: Hero(
            tag: 'alarm',
            child: Icon(Icons.alarm),
          ),
          title: Text('Reminders'),
          onTap: () => _navigateTo(
            context,
            'Reminders',
            BottomBarPage(icon: Icons.alarm, color: Colors.blue, tag: 'alarm'),
          ),
        ),
        Divider(color: Colors.grey),
        ListTile(
          leading: Icon(Icons.backspace),
          title: Text('Back'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  void _navigateTo(BuildContext context, String title, Widget target) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(title: Text(title)),
            body: target,
          );
        },
      ),
    );
  }
}
