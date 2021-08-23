import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                const RowWidget(),
                Padding(padding: EdgeInsets.all(16.0)),
                const RowAndColumnWidget(),
                Text('button was clicked $counter times')
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            print('CounterTextWidget was called');
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Row widget');

    return Row(
      children: [
        Container(
          color: Colors.yellow,
          width: 40,
          height: 40,
        ),
        Padding(padding: EdgeInsets.all(16.0)),
        Expanded(
          child: Container(
            color: Colors.amber,
            height: 40,
            width: 40,
          ),
        ),
        Padding(padding: EdgeInsets.all(16.0)),
        Container(
          color: Colors.brown,
          height: 40,
          width: 40,
        ),
      ],
    );
  }
}

class RowAndColumnWidget extends StatelessWidget {
  const RowAndColumnWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('RowAndColumn widget');

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: Colors.yellow,
              width: 60,
              height: 60,
            ),
            Padding(padding: EdgeInsets.all(16.0)),
            Container(
              color: Colors.amber,
              width: 40,
              height: 40,
            ),
            Padding(padding: EdgeInsets.all(16.0)),
            Container(
              color: Colors.brown,
              width: 20,
              height: 20,
            ),
            Divider(),
            const RowAndStackWidget(),
            const Divider(),
            const Text('End of the line')
          ],
        )
      ],
    );
  }
}

class RowAndStackWidget extends StatelessWidget {
  const RowAndStackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('RowAndStack widget');

    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.lightGreen,
          radius: 100,
          child: Stack(
            children: [
              Container(
                color: Colors.yellow,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.amber,
                width: 60,
                height: 60,
              ),
              Container(
                color: Colors.brown,
                width: 40,
                height: 40,
              ),
            ],
          ),
        )
      ],
    );
  }
}
