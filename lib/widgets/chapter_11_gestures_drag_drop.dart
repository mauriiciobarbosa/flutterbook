import 'package:flutter/material.dart';

class GesturesDragAndDrop extends StatefulWidget {
  @override
  _GesturesDragAndDropState createState() => _GesturesDragAndDropState();
}

class _GesturesDragAndDropState extends State<GesturesDragAndDrop> {
  String _gestureDetector = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestures - Drag and Drop'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildGestureDetector(),
              const Divider(color: Colors.black),
              _buildDraggable(),
              const Divider(color: Colors.black),
              _buildDragTarget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGestureDetector() {
    return GestureDetector(
      onTap: () {
        print('onTap');
        _displayGestureDetector('onTap');
      },
      onDoubleTap: () {
        print('onDoubleTap');
        _displayGestureDetector('onDoubleTap');
      },
      onLongPress: () {
        print('onLongPress');
        _displayGestureDetector('onLongPress');
      },
      onPanUpdate: (details) {
        print('onPanUpdate $details');
        _displayGestureDetector('onPanUpdate\n$details');
      },
      // onVerticalDragUpdate: (details) {
      //   print('onVerticalDragUpdate $details');
      //   _displayGestureDetector('onVerticalDragUpdate\n$details');
      // },
      // onHorizontalDragUpdate: (details) {
      //   print('onHorizontalDragUpdate $details');
      //   _displayGestureDetector('onHorizontalDragUpdate\n$details');
      // },
      // onHorizontalDragEnd: (details) {
      //   print('onHorizontalDragEnd $details');
      //
      //   if (details.primaryVelocity! < 0) {
      //     _displayGestureDetector(
      //         'Dragging right to left: ${details.velocity}');
      //   } else if (details.primaryVelocity! > 0) {
      //     _displayGestureDetector(
      //         'Dragging left to right: ${details.velocity}');
      //   }
      // },
      child: Container(
        color: Colors.lightGreen.shade100,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(Icons.access_alarm, size: 98),
            Text('$_gestureDetector'),
          ],
        ),
      ),
    );
  }

  void _displayGestureDetector(String gesture) {
    setState(() {
      _gestureDetector = gesture;
    });
  }

  Widget _buildDraggable() {
    return Draggable(
      feedback: Icon(Icons.brush, size: 80, color: Colors.deepOrange),
      childWhenDragging: Icon(Icons.palette, size: 48, color: Colors.grey),
      data: Colors.deepOrange.value,
      child: Column(
        children: [
          Icon(Icons.palette, size: 48, color: Colors.deepOrange),
          Text('Drag me below to change color'),
        ],
      ),
    );
  }

  DragTarget<int> _buildDragTarget() {
    Color _paintedColor = Colors.black;

    return DragTarget<int>(
      onAccept: (colorValue) {
        _paintedColor = Color(colorValue);
      },
      builder: (context, List<dynamic> acceptedData, rejectedData) {
        return acceptedData.isNotEmpty && acceptedData.first != null
            ? Text(
                'Painting Color: $acceptedData',
                style: TextStyle(
                  color: Color(acceptedData[0]),
                  fontWeight: FontWeight.bold,
                ),
              )
            : Text(
                'Drag to and see color change',
                style: TextStyle(color: _paintedColor),
              );
      },
    );
  }
}
