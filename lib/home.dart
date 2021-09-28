import 'package:ch4_starter_exercise/widgets/appendx_flexible_sample.dart';
import 'package:ch4_starter_exercise/widgets/chapter_11_gestures_drag_drop.dart';
import 'package:ch4_starter_exercise/widgets/chapter_12_channels.dart';
import 'package:flutter/material.dart';

import 'widgets/chapter_10_layouts.dart';
import 'widgets/chapter_11_dismissible.dart';
import 'widgets/chapter_11_gestures_scale.dart';
import 'widgets/chapter_4.dart';
import 'widgets/chapter_5.dart';
import 'widgets/chapter_5_form_validator.dart';
import 'widgets/chapter_6_orientation.dart';
import 'widgets/chapter_7_animated_ballon.dart';
import 'widgets/chapter_7_animated_container.dart';
import 'widgets/chapter_7_staggered_animated_ballon.dart';
import 'widgets/chapter_8_bottom_app_bar_navigation.dart';
import 'widgets/chapter_8_bottom_bar_navigation.dart';
import 'widgets/chapter_8_drawer_left.dart';
import 'widgets/chapter_8_drawer_right.dart';
import 'widgets/chapter_8_hero_animation.dart';
import 'widgets/chapter_8_navigator.dart';
import 'widgets/chapter_8_tabbar_bottom.dart';
import 'widgets/chapter_8_tabbar_top.dart';
import 'widgets/chapter_9_card.dart';
import 'widgets/chapter_9_custom_scroll_view.dart';
import 'widgets/chapter_9_grid_view_builder.dart';
import 'widgets/chapter_9_grid_view_count.dart';
import 'widgets/chapter_9_grid_view_extent.dart';
import 'widgets/chapter_9_list_view.dart';
import 'widgets/chapter_9_stack.dart';

class Home extends StatelessWidget {
  final List<_Item> items = [
    _Item('Chapter 4', Chapter4()),
    _Item('Chapter 5', Chapter5()),
    _Item('Chapter 5 - Form Validator', FormValidator()),
    _Item('Chapter 6 - Orientation', OrientationTest()),
    _Item('Chapter 7 - Animated Balloon', AnimatedBalloonSample()),
    _Item('Chapter 7 - Animated Container', AnimationSample()),
    _Item('Chapter 7 - Staggered Animated', StaggeredAnimatedBalloonSample()),
    _Item('Chapter 8 - BottomAppBar', BottomNavigationAppBarSample()),
    _Item('Chapter 8 - BottomNavigationBar', BottomNavigationBarSample()),
    _Item('Chapter 8 - Hero animation', HeroAnimationSample()),
    _Item('Chapter 8 - Navigator', NavigatorSample()),
    _Item('Chapter 8 - TabBar Bottom', TabBarBottomSample()),
    _Item('Chapter 8 - TabBar Top', TabBarTopSample()),
    _Item('Chapter 8 - Drawer Left', DrawerLeftSample()),
    _Item('Chapter 8 - Drawer Right', DrawerRightSample()),
    _Item('Chapter 9 - Card', CardSample()),
    _Item('Chapter 9 - ListView', ListViewSample()),
    _Item('Chapter 9 - GridView - Count', GridViewCountSample()),
    _Item('Chapter 9 - GridView - Extent', GridViewExtentSample()),
    _Item('Chapter 9 - GridView - Builder', GridViewBuilderSample()),
    _Item('Chapter 9 - Stack', StackSample()),
    _Item('Chapter 9 - Custom Scroll View', CustomScrollViewSample()),
    _Item('Chapter 10 - Complex Layout', ComplexLayoutSample()),
    _Item('Chapter 11 - Gestures - Drag and Drop', GesturesDragAndDrop()),
    _Item('Chapter 11 - Gestures - Scale', GesturesScale()),
    _Item('Chapter 11 - Gestures - Dismissible', GesturesDismissible()),
    _Item('Chapter 12 - Channels', ChannelsSample()),
    _Item('Appendix - Flexible', FlexibleSample()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guide Flutter'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, position) {
          return TextButton(
            onPressed: () => _openScreen(context, items[position].target),
            child: Text(items[position].title),
          );
        },
      ),
    );
  }

  void _openScreen(BuildContext context, Widget target) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => target));
  }
}

class _Item {
  _Item(this.title, this.target);

  String title;
  Widget target;
}
