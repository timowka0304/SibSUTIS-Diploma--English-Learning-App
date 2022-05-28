import 'package:easy_peasy/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({Key? key, required this.index, required this.onChangedTab})
      : super(key: key);
  final int index;
  final ValueChanged<int> onChangedTab;
  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
      child: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTabItem(
              0,
              Icon(
                Icons.book,
                size: ScreenUtil().setWidth(25),
              ),
            ),
            buildTabItem(
              1,
              Icon(
                Icons.apps,
                size: ScreenUtil().setWidth(25),
              ),
            ),
            buildTabItem(
              2,
              Icon(
                Icons.person,
                size: ScreenUtil().setWidth(25),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabItem(int index, Icon icon) {
    final isSelected = index == widget.index;
    return IconTheme(
      data: IconThemeData(
          color: isSelected ? kMainPink : kMainPurple.withOpacity(0.5)),
      child: IconButton(
        icon: icon,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: () => widget.onChangedTab(index),
      ),
    );
  }
}
