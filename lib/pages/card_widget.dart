import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget({this.shape, this.shapeName = 'Default'});

  final ShapeBorder? shape;
  final String shapeName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 8.0,
          shape: shape,
          color: Colors.white,
          margin: EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Barista',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  'Travel Plans',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          shapeName,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
