import 'package:flutter/material.dart';

class OrientationTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Mudou a orientacao');
    return Scaffold(
      appBar: AppBar(
        title: Text('Orientation'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                const OrientationLayoutIconsWidget(),
                const Divider(),
                const OrientationLayoutWidget(),
                const Divider(),
                const GridViewWidget(),
                const Divider(),
                const OrientationBuilderWidget(),
                const Divider(),
                const NoOrientation(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrientationLayoutIconsWidget extends StatelessWidget {
  const OrientationLayoutIconsWidget();

  @override
  Widget build(BuildContext context) {
    print('rebuildou OrientationLayoutIconsWidget');
    final Orientation orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.school, size: 48.0)],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.school, size: 48.0),
        Icon(Icons.brush, size: 48.0),
      ],
    );
  }
}

class OrientationLayoutWidget extends StatelessWidget {
  const OrientationLayoutWidget();

  @override
  Widget build(BuildContext context) {
    print('rebuildou OrientationLayoutWidget');
    final Orientation orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait) {
      return Container(
        alignment: Alignment.center,
        color: Colors.yellow,
        width: 100.0,
        height: 100.0,
        child: Text('Portrait'),
      );
    }

    return Container(
      alignment: Alignment.center,
      color: Colors.lightGreen,
      width: 200.0,
      height: 100.0,
      child: Text('Landscape'),
    );
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget();

  @override
  Widget build(BuildContext context) {
    print('rebuildou GridViewWidget');
    final Orientation orientation = MediaQuery.of(context).orientation;

    return GridView.count(
      shrinkWrap: true,
      // since this GridView is inside a column, this argument will not break the constraints.
      physics: NeverScrollableScrollPhysics(),
      // This GridView will not scrolls its children from within.
      crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
      childAspectRatio: 5.0,
      children: List.generate(8, (index) {
        return Text('Grid $index', textAlign: TextAlign.center);
      }),
    );
  }
}

class OrientationBuilderWidget extends StatelessWidget {
  const OrientationBuilderWidget();

  @override
  Widget build(BuildContext context) {
    print('rebuildou OrientationLayoutWidget');
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        if (orientation == Orientation.portrait) {
          return Container(
            alignment: Alignment.center,
            color: Colors.yellow,
            width: 100.0,
            height: 100.0,
            child: Text('Portrait'),
          );
        }

        return Container(
          alignment: Alignment.center,
          color: Colors.lightGreen,
          width: 200.0,
          height: 100.0,
          child: Text('Landscape'),
        );
      },
    );
  }
}

class NoOrientation extends StatelessWidget {
  const NoOrientation();

  @override
  Widget build(BuildContext context) {
    // por qual motivo não foi rebuildado?
    print('rebuildou NoOrientation');
    return Center(child: Text('No Orientation'));
  }
}
