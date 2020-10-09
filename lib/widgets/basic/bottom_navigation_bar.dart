import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';
import '../../assets/hg_images.dart';

class SPBottomNavigationBar extends StatelessWidget {
  final List<Widget> children;
  final Color backgroundColor;
  const SPBottomNavigationBar({
    Key key,
    @required this.children,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: SPUI.barHeight,
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        border: Border(
          top: BorderSide(color: theme.scaffoldBackgroundColor),
          bottom: BorderSide(color: theme.scaffoldBackgroundColor),
        ),
      ),
      child: Row(
        children: children,
      ),
    );
  }
}
