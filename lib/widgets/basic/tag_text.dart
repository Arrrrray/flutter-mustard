import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';
import '../../assets/hg_images.dart';
// 默认样式 是缺货断货、售后那种样式、红色半透明背景、红色字体

class SPTagText extends StatelessWidget {
  final double holderHeight;
  final double height;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final bool marginLeft;
  final bool marginRight;

  const SPTagText({
    Key key,
    @required this.text,
    this.holderHeight,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.height,
    this.marginLeft,
    this.marginRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _height = height ?? 36.rpx;
    var _fontSize = fontSize ?? 22.rpx;
    return Container(
      height: holderHeight ?? 48.rpx,
      alignment: Alignment.center,
      child: Container(
        height: _height,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 8.rpx, right: 8.rpx),
        margin: EdgeInsets.only(
          left: marginLeft == true ? 10.rpx : 0,
          right: marginRight == true ? 10.rpx : 0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6.rpx)),
          color: backgroundColor ?? rgba(248, 47, 63, 0.1),
        ),
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: textColor ?? rgba(248, 47, 63, 1),
            fontSize: _fontSize,
            height: _height / _fontSize,
          ),
        ),
      ),
    );
  }
}
