import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/tree.jpg'),
        Positioned(
          bottom: 10,
          left: 10,
          child: CircleAvatar(
            radius: 36,
            backgroundImage: AssetImage('assets/images/lion.jpg'),
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: Text(
            'Lion',
            style: TextStyle(
              fontSize: 32,
              color: Colors.white30,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
