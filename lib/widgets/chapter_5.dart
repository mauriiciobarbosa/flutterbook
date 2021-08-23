import 'package:ch4_starter_exercise/models/todo_menu_item.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Good title',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
        flexibleSpace: SafeArea(
          child: Icon(
            Icons.photo_camera,
            size: 75,
            color: Colors.white70,
          ),
        ),
        bottom: PopupMenuButtonWidget(),
        // bottom: PreferredSize(
        //   child: Container(
        //     color: Colors.lightGreen.shade100,
        //     height: 75,
        //     width: double.infinity,
        //     child: Center(
        //       child: Text('Bottom'),
        //     ),
        //   ),
        //   preferredSize: Size.fromHeight(75),
        // ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Buttons(),
                Divider(color: Colors.blue),
                const ContainerWithBoxDecorationWidget(),
                Divider(color: Colors.blue),
                const ImprovedText('Flutter World for Mobile'),
                Divider(color: Colors.blue),
                const Columns(),
                Divider(color: Colors.blue),
                const Rows(),
                Divider(color: Colors.blue),
                const ColumnsWithRows(),
                Divider(color: Colors.blue),
                const ImageAndIcons(),
                Divider(color: Colors.blue),
                const BoxDecorationWidget(),
                Divider(color: Colors.blue),
                const InputDecoratorsWidget(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.play_arrow),
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightGreen.shade200,
      ),
      // button with text
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   icon: Icon(Icons.play_arrow),
      //   label: Text('Play'),
      //   foregroundColor: Colors.white,
      //   backgroundColor: Colors.lightGreen.shade200,
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen.shade100,
        shape: CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.pause,
              color: Colors.white,
            ),
            Icon(
              Icons.stop,
              color: Colors.white,
            ),
            Icon(
              Icons.access_time,
              color: Colors.white,
            ),
            Padding(padding: EdgeInsets.all(32))
          ],
        ),
      ),
    );
  }
}

class ContainerWithBoxDecorationWidget extends StatelessWidget {
  const ContainerWithBoxDecorationWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(10),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.lightGreen.shade500,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(0, 10),
              )
            ],
          ),
          child: Center(
            child: RichText(
              text: TextSpan(
                text: 'Flutter world',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.deepPurple,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.deepPurpleAccent,
                  decorationStyle: TextDecorationStyle.dotted,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(text: ' for'),
                  TextSpan(
                    text: ' Mobile',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }
}

class ImprovedText extends StatelessWidget {
  const ImprovedText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          color: Colors.deepPurple,
          decoration: TextDecoration.underline,
          decorationColor: Colors.deepPurpleAccent,
          decorationStyle: TextDecorationStyle.dotted,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class Columns extends StatelessWidget {
  const Columns();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Column 1'),
        Divider(),
        Text('Column 2'),
        Divider(),
        Text('Column 3'),
      ],
    );
  }
}

class Rows extends StatelessWidget {
  const Rows();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      // mainAxisSize: MainAxisSize.max, (não fez diferença)
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Row 1'),
        Padding(padding: EdgeInsets.all(16)),
        Text('Row 2'),
        Padding(padding: EdgeInsets.all(16)),
        Text('Row 3'),
      ],
    );
  }
}

class ColumnsWithRows extends StatelessWidget {
  const ColumnsWithRows();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Columns and Rows nesting 1'),
        Text('Columns and Rows nesting 2'),
        Text('Columns and Rows nesting 3'),
        Padding(padding: EdgeInsets.all(16)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Row nesting 1'),
            Text('Row nesting 2'),
            Text('Row nesting 3'),
          ],
        ),
      ],
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          // Most minimalist button used
          TextButton(
            onPressed: () {},
            child: Text('Flag'),
          ),
          TextButton(
            onPressed: () {},
            child: Icon(
              Icons.flag,
              color: Colors.white,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
            ),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          /**
           * Adds a a dimension, and the elevation (shadow) increases when the
           * user presses the button.
           */
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          /**
           * Uses a icon widget on a Material Component widget that reacts to
           * touches by filling with color (ink). The combination creates a nice
           * tap effect, giving the user feedback that an action has started.
           */
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.flight,
            ),
            color: Colors.green,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.flight,
            ),
            color: Colors.green,
            iconSize: 42,
            tooltip: 'Flight',
          ),
        ],
      ),
      Container(
          color: Colors.white70,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.map)),
              IconButton(onPressed: () {}, icon: Icon(Icons.airport_shuttle)),
              IconButton(onPressed: () {}, icon: Icon(Icons.brush)),
            ],
          )
          /**
         * Uses a icon widget on a Material Component widget that reacts to
         * touches by filling with color (ink). The combination creates a nice
         * tap effect, giving the user feedback that an action has started.
         */
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.flight,
          //   ),
          //   color: Colors.green,
          // ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.flight,
          //   ),
          //   color: Colors.green,
          //   iconSize: 42,
          //   tooltip: 'Flight',
          // ),
          ),
    ]);
  }
}

class PopupMenuButtonWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final List<TodoMenuItem> foodItems = [
    TodoMenuItem(title: 'Fast food', icon: Icon(Icons.fastfood)),
    TodoMenuItem(title: 'Remind me', icon: Icon(Icons.add_alarm)),
    TodoMenuItem(title: 'Flight', icon: Icon(Icons.flight)),
    TodoMenuItem(title: 'Music', icon: Icon(Icons.audiotrack)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen.shade100,
      height: preferredSize.height,
      width: double.infinity,
      child: Center(
        child: PopupMenuButton<TodoMenuItem>(
          icon: Icon(Icons.view_list),
          onSelected: (value) => print('Value selected $value'),
          itemBuilder: (context) {
            return foodItems.map((item) {
              return PopupMenuItem<TodoMenuItem>(
                value: item,
                child: Row(
                  children: [
                    Icon(item.icon.icon),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(item.title),
                    )
                  ],
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(75);
}

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // You could use Image.asset instead
        Image(
          image: AssetImage('assets/images/logo.png'),
          // color: Colors.orange,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width / 3,
        ),
        Image.network(
          'https://flutter.dev/images/catalog-widget-placeholder.png',
          width: MediaQuery.of(context).size.width / 3,
        ),
        Icon(
          Icons.brush,
          color: Colors.lightBlue,
          size: 48,
        )
      ],
    );
  }
}

class BoxDecorationWidget extends StatelessWidget {
  const BoxDecorationWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.orange,
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset(0, 10))
          ],
        ),
      ),
    );
  }
}

class InputDecoratorsWidget extends StatelessWidget {
  const InputDecoratorsWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
          decoration: InputDecoration(
            labelText: 'Notes',
            labelStyle: TextStyle(color: Colors.purple),
            // border: UnderlineInputBorder(),
            // enabledBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.purple),
            // ),
            border: OutlineInputBorder(),
          ),
        ),
        Divider(color: Colors.lightGreen, height: 50),
        TextFormField(
          decoration: InputDecoration(labelText: 'Enter your notes'),
        ),
      ],
    );
  }
}
