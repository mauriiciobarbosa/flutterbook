import 'package:flutter/material.dart';

class ListViewSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Sample'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            print('Building item for index $index');
            if (index == 0) {
              return _HeaderWidget();
            } else if (index >= 1 && index <= 3) {
              return _RowWithCardWidget(index: index);
            } else {
              return _RowWidget(index: index);
            }
          },
        ),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 120,
      child: Card(
        elevation: 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Barista',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
                color: Colors.orange,
              ),
            ),
            Text(
              'Travel Plans',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RowWithCardWidget extends StatelessWidget {
  _RowWithCardWidget({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: ListTile(
        leading: Icon(Icons.flight, size: 48, color: Colors.lightBlue),
        title: Text('Airplane $index'),
        subtitle: Text('Very Cool'),
        trailing: Text(
          '${7 * index}%',
          style: TextStyle(color: Colors.lightBlue),
        ),
        // selected: true,
        onTap: () => print('Tapped on Row $index'),
      ),
    );
  }
}

class _RowWidget extends StatelessWidget {
  _RowWidget({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.directions_car, size: 48, color: Colors.lightGreen),
      title: Text('Car $index'),
      subtitle: Text('Very Cool'),
      trailing: (index % 3).isEven
          ? Icon(Icons.bookmark_border)
          : Icon(Icons.bookmark),
      selected: false,
      onTap: () => print('Tapped on Row $index'),
    );
  }
}
