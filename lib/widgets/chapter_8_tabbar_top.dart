import 'package:ch4_starter_exercise/pages/bottom_bar_page.dart';
import 'package:flutter/material.dart';

class TabBarTopSample extends StatefulWidget {
  @override
  _TabBarTopSampleState createState() => _TabBarTopSampleState();
}

class _TabBarTopSampleState extends State<TabBarTopSample>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(_tabChanged);
  }

  void _tabChanged() {
    // check if Tab Controller index is changing, otherwise we get the notice twice.
    if (_controller.indexIsChanging) {
      print('Tab changed: ${_controller.index}');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // iconTheme: IconThemeData(color: Colors.white),
        // actionsIconTheme: IconThemeData(color: Colors.white),
        // title: Text('TabBar top', style: TextStyle(color: Colors.white)),
        title: Text('TabBar top'),
        bottom: TabBar(
          controller: _controller,
          labelColor: Colors.black54,
          unselectedLabelColor: Colors.black38,
          // indicatorColor: Colors.purple,
          tabs: [
            Tab(
              icon: Icon(Icons.cake),
              text: 'Birthdays',
            ),
            Tab(
              icon: Icon(Icons.sentiment_very_satisfied),
              text: 'Gratitude',
            ),
            Tab(
              icon: Icon(Icons.access_alarm),
              text: 'Reminders',
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _controller,
          children: [
            BottomBarPage(icon: Icons.cake, color: Colors.orange),
            BottomBarPage(
              icon: Icons.sentiment_very_satisfied,
              color: Colors.lightGreen,
            ),
            BottomBarPage(icon: Icons.access_alarm, color: Colors.purple)
          ],
        ),
      ),
    );
  }
}
