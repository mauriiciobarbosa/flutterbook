import 'package:ch4_starter_exercise/pages/bottom_bar_page.dart';
import 'package:flutter/material.dart';

class BottomNavigationAppBarSample extends StatefulWidget {
  @override
  _BottomNavigationAppBarSampleState createState() =>
      _BottomNavigationAppBarSampleState();
}

class _BottomNavigationAppBarSampleState
    extends State<BottomNavigationAppBarSample> {
  int _currentIndex = 0;
  List<Widget> _listPages = [];
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();

    _listPages
      ..add(BottomBarPage(icon: Icons.access_alarm, color: Colors.orange))
      ..add(BottomBarPage(
        icon: Icons.bookmark_border,
        color: Colors.lightGreen,
      ))
      ..add(BottomBarPage(icon: Icons.flight, color: Colors.purple));
    _currentPage = _listPages.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Text(
          'Bottom Navigation Bar',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: _currentPage,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade200,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue.shade200,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => _changePage(0),
              color: Colors.white,
              icon: Icon(Icons.access_alarm),
            ),
            IconButton(
              onPressed: () => _changePage(1),
              color: Colors.white,
              icon: Icon(Icons.bookmark_border),
            ),
            IconButton(
              onPressed: () => _changePage(2),
              color: Colors.white,
              icon: Icon(Icons.flight),
            ),
            Divider(),
          ],
        ),
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
