import 'package:ch4_starter_exercise/models/grid_icon.dart';
import 'package:flutter/material.dart';

class GridViewExtentSample extends StatelessWidget {
  final GridIcons _gridIcons = GridIcons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView - Extent'),
      ),
      body: SafeArea(
        child: GridView.extent(
          maxCrossAxisExtent: 175,
          scrollDirection: Axis.horizontal,
          children: List.generate(700, (index) {
            print('_buildGridView $index');

            return Card(
              margin: EdgeInsets.all(8),
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _gridIcons.getIcon(index),
                      size: 48,
                      color: Colors.blue,
                    ),
                    Text(
                      'Index ${index + 1}',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                onTap: () => print('Row $index'),
              ),
            );
          }),
        ),
      ),
    );
  }
}
