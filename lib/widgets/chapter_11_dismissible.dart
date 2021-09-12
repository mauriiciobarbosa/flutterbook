import 'package:ch4_starter_exercise/models/trip.dart';
import 'package:flutter/material.dart';

class GesturesDismissible extends StatefulWidget {
  @override
  _GesturesDismissibleState createState() => _GesturesDismissibleState();
}

class _GesturesDismissibleState extends State<GesturesDismissible> {
  final List<Trip> _trips = [
    Trip(id: 1, city: 'Rome', country: 'Italy'),
    Trip(id: 2, city: 'Paris', country: 'France'),
    Trip(id: 3, city: 'New York', country: 'USA - New York'),
    Trip(id: 4, city: 'London', country: 'England'),
    Trip(id: 5, city: 'Sydney', country: 'Australia'),
    Trip(id: 6, city: 'Miami', country: 'USA - Florida'),
    Trip(id: 7, city: 'Rio de Janeiro', country: 'Brazil'),
    Trip(id: 8, city: 'Cusco', country: 'Peru'),
    Trip(id: 9, city: 'New Delhi', country: 'India'),
    Trip(id: 10, city: 'Tokyo', country: 'Japan'),
    Trip(id: 11, city: 'Buenos Aires', country: 'Argentina'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dismissible'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _trips.length,
          itemBuilder: (context, position) {
            return Dismissible(
              key: Key(_trips[position].id.toString()),
              background: _markTripAsCompleted(),
              secondaryBackground: _deleteTrip(),
              onDismissed: (dismissDirection) {
                if (dismissDirection == DismissDirection.startToEnd) {
                  _markTripAsCompleted();
                } else {
                  _deleteTrip();
                }
                setState(() {
                  _trips.removeAt(position);
                });
              },
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Icon(Icons.flight),
                ),
                title: Text(_trips[position].city),
                subtitle: Text(_trips[position].country),
                trailing: Icon(Icons.fastfood),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _markTripAsCompleted() {
    return Container(
      color: Colors.green,
      padding: EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Icon(Icons.done, color: Colors.white),
      ),
    );
  }

  Widget _deleteTrip() {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.centerRight,
        child: Icon(Icons.delete, color: Colors.white),
      ),
    );
  }
}
