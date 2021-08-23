import 'package:flutter/material.dart';

class AnimationSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Example'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AnimatedContainerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget();

  @override
  _AnimatedContainerWidgetState createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  double _width = 100;
  double _height = 100;

  void _increaseWidth() {
    setState(() {
      _width = _width >= 320.0 ? 100.0 : _width += 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          // type of animation
          curve: Curves.elasticOut,
          color: Colors.yellow,
          width: _width,
          height: _height,
          child: ElevatedButton(
            onPressed: () => _increaseWidth(),
            child: Text('Tap to\n grow width\n $_width'),
          ),
        ),
      ],
    );
  }
}
