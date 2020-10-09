import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';
import '../../assets/hg_images.dart';

class SPDividerText extends StatelessWidget {
  double height;
  double lineWidth;
  Color color;
  String text;
  double fontSize;

  SPDividerText({Key key, this.height, this.lineWidth, this.color, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 100.rpx,
      padding: EdgeInsets.only(left: 20.rpx, right: 20.rpx),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
                height: lineWidth ?? 1.rpx, color: color ?? Colors.black38),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.rpx, right: 20.rpx),
            child: Text(
              text ?? "没有更多了",
              style: TextStyle(
                  color: color ?? Colors.black38, fontSize: fontSize ?? 30.rpx),
            ),
          ),
          Expanded(
            child: Container(
                height: lineWidth ?? 1.rpx, color: color ?? Colors.black38),
          ),
        ],
      ),
    );
  }
}
