import 'package:flutter/material.dart';

class StaggeredAnimatedBalloonSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Balloon Example 2'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const StaggeredAnimatedBalloonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StaggeredAnimatedBalloonWidget extends StatefulWidget {
  const StaggeredAnimatedBalloonWidget();

  @override
  _StaggeredAnimatedBalloonWidgetState createState() =>
      _StaggeredAnimatedBalloonWidgetState();
}

class _StaggeredAnimatedBalloonWidgetState
    extends State<StaggeredAnimatedBalloonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationFloatUp;
  late Animation<double> _animationGrowSize;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double balloonHeight = MediaQuery.of(context).size.height / 2;
    double balloonWidth = MediaQuery.of(context).size.height / 3;
    double balloonBottomLocation =
        MediaQuery.of(context).size.height - balloonHeight;

    _animationFloatUp = Tween(
      begin: balloonBottomLocation,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
    ));
    _animationGrowSize = Tween(
      begin: 50.0,
      end: balloonWidth,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.5, curve: Curves.elasticInOut),
    ));

    _controller.forward();

    return AnimatedBuilder(
      animation: _animationFloatUp, // é o mais duradouro
      builder: (context, child) {
        print('Construindo com floatUp ${_animationFloatUp.value} e '
            'growSize: ${_animationGrowSize.value}');
        return Container(
          child: child,
          margin: EdgeInsets.only(
            top: _animationFloatUp.value,
          ),
          width: _animationGrowSize.value,
        );
      },
      child: GestureDetector(
        onTap: () {
          if (_controller.isCompleted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Image.asset(
          'assets/images/beginningGoogleFlutter-Ballon.png',
          height: balloonHeight, // por qual motivo o height altera o tamanho?
          width: balloonWidth,
        ),
      ),
    );
  }
}
