import 'package:flutter/material.dart';

class Gratitude extends StatefulWidget {
  const Gratitude({this.radioGroupValue = -1});

  final int radioGroupValue;

  @override
  _GratitudeState createState() => _GratitudeState();
}

class _GratitudeState extends State<Gratitude> {
  String _selectedGratitude = '';
  List<String> _gratitudeList = [];
  int _radioGroupValue = 0;

  @override
  void initState() {
    super.initState();
    _radioGroupValue = widget.radioGroupValue;
    _gratitudeList..add('Family')..add('Friends')..add('Coffee');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gratitude'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context, _selectedGratitude),
            icon: Icon(Icons.check),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Radio<int>(
                value: 0,
                groupValue: _radioGroupValue,
                onChanged: (index) => _radioOnChanged(index!),
              ),
              Text(_gratitudeList.first),
              Radio<int>(
                value: 1,
                groupValue: _radioGroupValue,
                onChanged: (index) => _radioOnChanged(index!),
              ),
              Text(_gratitudeList[1]),
              Radio<int>(
                value: 2,
                groupValue: _radioGroupValue,
                onChanged: (index) => _radioOnChanged(index!),
              ),
              Text(_gratitudeList.last),
            ],
          ),
        ),
      ),
    );
  }

  void _radioOnChanged(int index) {
    setState(() {
      _radioGroupValue = index;
      _selectedGratitude = _gratitudeList[index];
    });
  }
}
