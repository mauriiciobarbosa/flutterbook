import 'package:flutter/material.dart';

class ComplexLayoutSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Layouts',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        brightness: Brightness.light,
        // leading: IconButton(
        //   icon: Icon(Icons.cloud_queue),
        //   onPressed: () {},
        // ),
        actions: [
          IconButton(
            icon: Icon(Icons.cloud_queue),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/present.jpg', fit: BoxFit.cover),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _buildJournalEntry(),
                    SizedBox(height: 16),
                    _buildJournalWeather(),
                    SizedBox(height: 16),
                    _buildJournalTags(),
                    SizedBox(height: 16),
                    _buildJournalFooterImages(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJournalEntry() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Birthday',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'It\'s going to be a great birthday. We are going out for dinner at '
          'my favorite place, then watch a movie after we go to the '
          'gelateria for ice cream and espresso.',
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildJournalWeather() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.wb_sunny, color: Colors.orange),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '24° Mostly sunny',
              style: TextStyle(color: Colors.deepOrange),
            ),
            Text(
              '4500 San Alpho Drive, Dallas, TX United States',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildJournalTags() {
    return Wrap(
      spacing: 8,
      children: List.generate(
        12,
        (index) => Chip(
          label: Text('Gift ${index + 1}', style: TextStyle(fontSize: 10)),
          avatar: Icon(Icons.card_giftcard, color: Colors.blue.shade300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey),
          ),
          backgroundColor: Colors.grey.shade100,
        ),
      ),
    );
  }

  Widget _buildJournalFooterImages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/salmon.jpg'),
          radius: 40,
        ),
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/asparagus.jpg'),
          radius: 40,
        ),
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/strawberries.jpg'),
          radius: 40,
        ),
        SizedBox(
          width: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.cake),
              Icon(Icons.star_border),
              Icon(Icons.music_note),
            ],
          ),
        )
      ],
    );
  }
}
