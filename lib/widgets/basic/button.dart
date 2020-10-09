import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';

class SPButton extends StatelessWidget {
  final Function onTap;
  final double width;
  final double height;
  final String content;
  final Color color;
  final Color contentColor;
  final BoxBorder border;
  SPButton({
    Key key,
    this.onTap,
    this.width,
    this.height,
    this.content,
    this.color,
    this.contentColor,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(horizontal: 10.rpx, vertical: 0),
      color: color,
      elevation: 0,
      // height: height,
      child: Text(
        "${content}",
        maxLines: 1,
        softWrap: false,
        textAlign: TextAlign.center,
        overflow: TextOverflow.fade,
        style: TextStyle(
          textBaseline: TextBaseline.ideographic,
          height: 60 / 45,
          color: contentColor,
          fontSize: 24.rpx,
          fontWeight: FontWeight.w400,
        ),
        textWidthBasis: TextWidthBasis.parent,
      ),
      onPressed: onTap,
    );
  }
}

class SPButton80 extends SPButton {
  final Function onTap;
  final double width;
  final String content;
  SPButton80({
    Key key,
    this.onTap,
    this.width,
    this.content,
    Color color,
    Color contentColor,
    BoxBorder border,
  }) : super(
          key: key,
          onTap: onTap,
          width: width,
          height: 80.rpx,
          content: content,
          color: color,
          contentColor: contentColor,
          border: border,
        );
}

class SPButton60 extends SPButton {
  final Function onTap;
  final double width;
  final String content;
  SPButton60({
    Key key,
    this.onTap,
    this.width,
    this.content,
    Color color,
    Color contentColor,
    BoxBorder border,
  }) : super(
          key: key,
          onTap: onTap,
          width: width,
          // height: 60.rpx,
          content: content,
          color: color,
          contentColor: contentColor,
          border: border,
        );
}
