import 'package:flutter/material.dart';

class CustomScrollViewSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            // snap: true,
            // floating: true,
            backgroundColor: Colors.brown,
            forceElevated: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Parallax Effect'),
              background: Image(
                image: AssetImage('assets/images/desk.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(
                12,
                (index) => InkWell(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                      backgroundColor: Colors.lightGreen,
                      foregroundColor: Colors.white,
                    ),
                    title: Text('Row ${index + 1}'),
                    subtitle: Text('Subtitle Row ${index + 1}'),
                    trailing: Icon(Icons.star_border),
                  ),
                  onTap: () => print('Row ${index + 1} clicked'),
                ),
              ),
            ),
          ),
          SliverSafeArea(
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.child_friendly,
                              size: 48, color: Colors.amber),
                          Divider(),
                          Text('Grid ${index + 1}'),
                        ],
                      ),
                      onTap: () => print('Card ${index + 1} clicked'),
                    ),
                  );
                },
                childCount: 12,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
            ),
          )
        ],
      ),
    );
  }
}
