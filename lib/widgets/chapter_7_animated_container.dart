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
              const Divider(),
              const AnimatedCrossFadeWidget(),
              const Divider(),
              const AnimatedOpacityWidget(),
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
          child: TextButton(
            onPressed: () => _increaseWidth(),
            child: Text(
              'Tap to\n grow width\n $_width',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget();

  @override
  _AnimatedCrossFadeWidgetState createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool _crossFadeStateShowFirst = true;

  void _crossFade() {
    setState(() {
      _crossFadeStateShowFirst = !_crossFadeStateShowFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            AnimatedCrossFade(
              duration: Duration(milliseconds: 500),
              // type of animation
              sizeCurve: Curves.bounceOut,
              crossFadeState: _crossFadeStateShowFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: Container(
                color: Colors.amber,
                height: 100,
                width: 100,
              ),
              secondChild: Container(
                color: Colors.lime,
                height: 200,
                width: 200,
              ),
            ),
            Positioned.fill(
              child: TextButton(
                onPressed: () => _crossFade(),
                child: Text(
                  'Tap to\n fade color & size',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class AnimatedOpacityWidget extends StatefulWidget {
  const AnimatedOpacityWidget();

  @override
  _AnimatedOpacityWidgetState createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  double _opacity = 1.0;

  void _animateOpacity() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.2 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(milliseconds: 500),
          child: Container(
            color: Colors.amber,
            height: 100,
            width: 100,
            child: TextButton(
              onPressed: () => _animateOpacity(),
              child: Text(
                'Tap to fade',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        )
      ],
    );
  }
}
