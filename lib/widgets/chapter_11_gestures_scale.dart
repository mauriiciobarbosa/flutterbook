import 'package:flutter/material.dart';

class GesturesScale extends StatefulWidget {
  @override
  _GesturesScaleState createState() => _GesturesScaleState();
}

class _GesturesScaleState extends State<GesturesScale> {
  Offset _startLastOffset = Offset.zero;
  Offset _lastOffset = Offset.zero;
  Offset _currentOffset = Offset(0, 0);
  double _lastScale = 1;
  double _currentScale = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestures - Scale'),
      ),
      body: SafeArea(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return GestureDetector(
      onScaleStart: _onScaleStart,
      onScaleUpdate: _onScaleUpdate,
      onDoubleTap: _onDoubleTap,
      onLongPress: _onLongPress,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _transformScaleAndTranslate(),
          // _transformMatrix4(),
          _positionedStatusBar(context),
          _positionedInkWellAndInkResponse(context),
        ],
      ),
    );
  }

  Widget _transformScaleAndTranslate() {
    return Transform.scale(
      scale: _currentScale,
      child: Transform.translate(
        offset: _currentOffset,
        child: Image.asset('assets/images/elephant.jpg'),
      ),
    );
  }

  Widget _transformMatrix4() {
    return Transform(
      transform: Matrix4.identity()
        ..scale(_currentScale, _currentScale)
        ..translate(_currentOffset.dx, _currentOffset.dy),
      alignment: FractionalOffset.center,
      child: Image.asset(
        'assets/images/elephant.jpg',
      ),
    );
  }

  Widget _positionedStatusBar(BuildContext context) {
    return Positioned(
      top: 0.0,
      // left: 16,
      // right: 16,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.blue.shade100,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Scale: ${_currentScale.toStringAsFixed(4)}'),
            Text('Current: $_currentOffset'),
          ],
        ),
      ),
    );
  }

  Widget _positionedInkWellAndInkResponse(BuildContext context) {
    return Positioned(
      top: 50.0,
      // left: 16,
      // right: 16,
      width: MediaQuery.of(context).size.width,
      child: Container(
        // color: Colors.blue.shade100,
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              child: Container(
                height: 48,
                width: 128,
                color: Colors.black12,
                child: Icon(Icons.touch_app, size: 32),
              ),
              splashColor: Colors.lightGreenAccent,
              highlightColor: Colors.lightBlueAccent,
              onTap: _setScaleSmall,
              onDoubleTap: _setScaleBig,
              onLongPress: _onLongPress,
            ),
            InkResponse(
              child: Container(
                height: 48,
                width: 128,
                color: Colors.black12,
                child: Icon(Icons.touch_app, size: 32),
              ),
              splashColor: Colors.lightGreenAccent,
              highlightColor: Colors.lightBlueAccent,
              onTap: _setScaleSmall,
              onDoubleTap: _setScaleBig,
              onLongPress: _onLongPress,
            ),
          ],
        ),
      ),
    );
  }

  void _onScaleStart(ScaleStartDetails details) {
    print('ScaleStartDetails $details');

    _startLastOffset = details.focalPoint;
    _lastOffset = _currentOffset;
    _lastScale = _currentScale;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    print('ScaleUpdateDetails $details - scale ${details.scale}');

    if (details.scale != 1.0) {
      // scaling
      final currentScale =
          (_lastScale * details.scale < 0.5) ? 0.5 : _lastScale * details.scale;

      setState(() {
        _currentScale = currentScale;
      });

      print('_scale: $_currentScale, _lastScale: $_lastScale');
    } else {
      final offsetAdjustForScale =
          (_startLastOffset - _lastOffset) / _lastScale;
      final currentOffset =
          details.focalPoint - (offsetAdjustForScale * _currentScale);

      setState(() {
        _currentOffset = currentOffset;
      });

      print(
        'OffsetAdjustedForScale: $offsetAdjustForScale,'
        ' _currentOffset: $_currentOffset',
      );
    }
  }

  void _onDoubleTap() {
    print('onDoubleTap');

    double currentScale = _lastScale * 2;

    if (currentScale > 16) {
      currentScale = 1;
      _resetToDefaultValues();
    }

    _lastScale = currentScale;

    setState(() {
      _currentScale = currentScale;
    });
  }

  void _onLongPress() {
    print('onLongPress');

    setState(() {
      _resetToDefaultValues();
    });
  }

  void _resetToDefaultValues() {
    _startLastOffset = Offset.zero;
    _lastOffset = Offset.zero;
    _currentOffset = Offset(0, 0);
    _lastScale = 1;
    _currentScale = 1;
  }

  void _setScaleSmall() {
    setState(() {
      _currentScale = 0.5;
    });
  }

  void _setScaleBig() {
    setState(() {
      _currentScale = 16;
    });
  }
}
