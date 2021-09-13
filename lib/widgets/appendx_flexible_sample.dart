import 'package:flutter/material.dart';

class FlexibleSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flexible'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(color: Colors.cyan),
            ),
            Flexible(
              flex: 3,
              child: Container(color: Colors.teal),
            ),
            Flexible(
              flex: 1,
              child: Container(color: Colors.indigo),
            ),
          ],
        ),
      ),
    );
  }
}
