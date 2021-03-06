import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';
import '../../assets/hg_images.dart';

class SPGrid extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  const SPGrid(
      {Key key, this.child, @required this.width, @required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(minHeight: double.infinity, minWidth: double.infinity),
      alignment: Alignment.center,
      // constraints:  BoxConstraints.expand(),
      // height: MediaQuery.of(context).size.height.rpx,
      // color: rgba(255, 255, 255, 1),
      width: width,
      height: height,
      child: child,
    );
  }
}
