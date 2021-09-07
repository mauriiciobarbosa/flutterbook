import 'package:ch4_starter_exercise/pages/bottom_bar_page.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarSample extends StatefulWidget {
  @override
  _BottomNavigationBarSampleState createState() =>
      _BottomNavigationBarSampleState();
}

class _BottomNavigationBarSampleState extends State<BottomNavigationBarSample> {
  int _currentIndex = 0;
  List<Widget> _listPages = [];
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();

    _listPages
      ..add(BottomBarPage(icon: Icons.cake, color: Colors.orange))
      ..add(BottomBarPage(
        icon: Icons.sentiment_very_satisfied,
        color: Colors.lightGreen,
      ))
      ..add(BottomBarPage(icon: Icons.alarm, color: Colors.purple));
    _currentPage = _listPages.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: _currentPage,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            label: 'Birthdays',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_very_satisfied),
            label: 'Gratitude',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            label: 'Reminders',
          ),
        ],
        onTap: (selectedIndex) => _changePage(selectedIndex),
      ),
    );
  }

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
    });
  }
}
