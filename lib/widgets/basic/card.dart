import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';
import '../../assets/hg_images.dart';

class SPCard extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final double paddingSize;
  final Color backgroundColor;

  const SPCard({
    Key key,
    this.onTap,
    @required this.child,
    this.backgroundColor,
    this.paddingSize,
    bool withPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0,
        color: this.backgroundColor,
        child: Container(
          padding: EdgeInsets.all(paddingSize ?? 24.rpx),
          child: child,
        ),
      ),
    );
  }
}
