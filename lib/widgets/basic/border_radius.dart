import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';
import '../../assets/hg_images.dart';

class ClipRRectBy extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  const ClipRRectBy({
    Key key,
    @required this.child,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 20.rpx),
      child: child,
    );
  }
}
