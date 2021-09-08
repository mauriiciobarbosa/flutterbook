import 'package:ch4_starter_exercise/pages/stack_favorite_widget.dart';
import 'package:ch4_starter_exercise/pages/stack_widget.dart';
import 'package:flutter/material.dart';

class StackSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return index.isEven ? StackWidget() : StackFavoriteWidget();
          },
        ),
      ),
    );
  }
}
