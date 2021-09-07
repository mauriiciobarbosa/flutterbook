import 'package:flutter/material.dart';

class BottomBarPage extends StatelessWidget {
  const BottomBarPage({
    required this.icon,
    required this.color,
    this.tag = '',
  });

  final IconData icon;
  final Color color;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: tag,
          child: Icon(icon, size: 120, color: color),
        ),
      ),
    );
  }
}
