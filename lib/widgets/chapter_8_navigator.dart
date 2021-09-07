import 'package:ch4_starter_exercise/pages/about.dart';
import 'package:flutter/material.dart';

class NavigatorSample extends StatefulWidget {
  @override
  _NavigatorSampleState createState() => _NavigatorSampleState();
}

class _NavigatorSampleState extends State<NavigatorSample> {
  String _howAreYou = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator'),
        actions: [
          IconButton(
            onPressed: () => _openPageAbout(
              context: context,
              fullScreenDialog: true,
            ),
            icon: Icon(Icons.info_outline),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'Grateful for: $_howAreYou',
            style: TextStyle(fontSize: 32),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.sentiment_satisfied),
        tooltip: 'About',
        onPressed: () => _openPageGratitude(context: context),
      ),
    );
  }

  void _openPageAbout({
    required BuildContext context,
    bool fullScreenDialog = false,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullScreenDialog,
        builder: (context) => About(),
      ),
    );
    // Navigator.pushNamed(context, '/about');
  }

  void _openPageGratitude({
    required BuildContext context,
    bool fullScreenDialog = false,
  }) async {
    final response = await Navigator.pushNamed(context, '/gratitude');
    // final response = await Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     fullscreenDialog: fullScreenDialog,
    //     builder: (context) => Gratitude(radioGroupValue: -1),
    //   ),
    // );

    setState(() {
      _howAreYou = response?.toString() ?? _howAreYou;
    });
  }
}
