import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';
import '../../assets/hg_images.dart';

import 'button.dart';

class SPCheckboxButton extends StatelessWidget {
  final String content;
  final bool checked;
  final Function onTap;
  final double width;

  const SPCheckboxButton({
    Key key,
    @required this.content,
    @required this.checked,
    @required this.onTap,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width,
      // decoration: checked ? _checkedDecoration : _uncheckedDecoration,
      child: SPButton60(
        onTap: onTap,
        width: width,
        content: content,
        contentColor: checked ? theme.indicatorColor : rgba(33, 37, 41, 1),
        color: checked ? rgba(248, 47, 63, 0.08) : rgba(245, 245, 245, 1),
      ),
    );
  }
}
