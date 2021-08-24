import 'package:flutter/material.dart';

class AnimatedBalloonSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Balloon Example'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AnimatedBalloonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedBalloonWidget extends StatefulWidget {
  const AnimatedBalloonWidget();

  @override
  _AnimatedBalloonWidgetState createState() => _AnimatedBalloonWidgetState();
}

class _AnimatedBalloonWidgetState extends State<AnimatedBalloonWidget>
    with TickerProviderStateMixin {
  late AnimationController _controllerFloatUp;
  late AnimationController _controllerGrowSize;
  late Animation<double> _animationFloatUp;
  late Animation<double> _animationGrowSize;

  @override
  void initState() {
    super.initState();

    _controllerFloatUp = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    _controllerGrowSize = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controllerFloatUp.dispose();
    _controllerGrowSize.dispose();

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
      parent: _controllerFloatUp,
      curve: Curves.fastOutSlowIn,
    ));
    _animationGrowSize = Tween(
      begin: 50.0,
      end: balloonWidth,
    ).animate(CurvedAnimation(
      parent: _controllerGrowSize,
      curve: Curves.elasticInOut,
    ));

    _controllerFloatUp.forward();
    _controllerGrowSize.forward();

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
          if (_controllerFloatUp.isCompleted) {
            _controllerFloatUp.reverse();
            _controllerGrowSize.reverse();
          } else {
            _controllerFloatUp.forward();
            _controllerGrowSize.forward();
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
