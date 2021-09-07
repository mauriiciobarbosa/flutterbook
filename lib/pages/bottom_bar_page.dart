import 'package:flutter/material.dart';

class BottomBarPage extends StatelessWidget {
  const BottomBarPage({required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(icon, size: 120, color: color),
      ),
    );
  }
}
