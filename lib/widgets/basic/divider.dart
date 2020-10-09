import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';
import '../../assets/hg_images.dart';

class SPDivider extends StatelessWidget {
  final Color color;
  final double height;
  const SPDivider({Key key, this.color, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Divider(
        height: height ?? 48.rpx,
        color: color ?? rgba(245, 245, 245, 1),
      ),
    );
  }
}
