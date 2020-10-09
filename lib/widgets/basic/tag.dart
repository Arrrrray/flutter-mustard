import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';
import '../../assets/hg_images.dart';

/// SPTag标签是标签的基础
class SPTag extends StatelessWidget {
  SPTag({
    Key key,
    @required this.text,
    this.fontSize,
    this.fontWeight: FontWeight.normal,
    this.textColor,
    this.bgColor,
    this.borderless: false,
    this.borderRadius,
    this.borderWidth,
    // this.height,
    this.padding,
  })  : assert(text != null, 'text can not be empty.'),
        super(key: key);

  /// 文字
  final String text;

  /// 文字大小
  final double fontSize;

  // 字体粗细
  final FontWeight fontWeight;

  /// 文字颜色
  final Color textColor;

  /// 标签颜色
  final Color bgColor;

  /// 是否无边框
  final bool borderless;

  /// 边框厚度
  final double borderWidth;

  /// 圆角
  final double borderRadius;

  /// 标签高度
  // final double height;

  /// 标签边距
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return new Container(
      // 设置内边距
      padding: this.padding,
      // 设置边框和背景色
      decoration: BoxDecoration(
          // 设置圆角
          borderRadius:
              new BorderRadius.all(new Radius.circular(this.borderRadius)),
          // 设置边框
          border: this.borderless
              ? null
              : Border.all(color: this.textColor, width: this.borderWidth),
          // 设置标签背景颜色
          color: this.bgColor),
      child: Text(
        this.text,
        style: TextStyle(
          // 字体颜色
          color: this.textColor,
          // backgroundColor: Color.fromRGBO(187, 187, 187, 1),
          // 行高
          // height: this.height / this.fontSize,
          // 字号
          fontSize: this.fontSize,
          fontWeight: this.fontWeight,
        ),
      ),
    );
  }

  /// TagWidthBorder 表示带有边框的标签。
  /// type表示标签的类型，可选。默认为default表示红色边框白色背景颜色的标签
  /// size控制大小，可选，可选值为big，min，默认为大标签。
  static SPTag productTag(String text,
      {type: 'border', size: 'big', textColor, bgColor}) {
    if (type == 'border') {
      if (size == 'mini') {
        return SPTag(
            text: text,
            fontSize: 16.rpx,
            textColor: textColor ?? Color.fromRGBO(179, 27, 27, 1),
            bgColor: textColor ?? Color.fromRGBO(255, 255, 255, 1),
            borderRadius: 4.rpx,
            borderWidth: 1.rpx,
            padding: EdgeInsets.symmetric(vertical: 2.rpx, horizontal: 8.rpx));
      }
    } else if (type == 'borderless') {
      return SPTag(
          text: text,
          fontSize: 20.rpx,
          fontWeight: FontWeight.w500,
          textColor: textColor ?? Color.fromRGBO(248, 47, 63, 1),
          bgColor: bgColor ?? Color.fromRGBO(248, 47, 63, .1),
          borderRadius: 4.rpx,
          // height: 32.rpx,
          borderless: true,
          padding: EdgeInsets.symmetric(vertical: 2.rpx, horizontal: 6.rpx));
    } else if (type == 'gp') {
      return SPTag(
          text: text,
          fontSize: 20.rpx,
          textColor: textColor ?? Color.fromRGBO(255, 255, 255, 1),
          bgColor: bgColor ?? Color.fromRGBO(179, 27, 27, 1),
          borderRadius: 6.rpx,
          // height: 28.rpx,
          borderless: true,
          padding: EdgeInsets.symmetric(vertical: 2.rpx, horizontal: 6.rpx));
    }
    return SPTag(
        text: text,
        fontSize: 20.rpx,
        textColor: textColor ?? Color.fromRGBO(179, 27, 27, 1),
        bgColor: textColor ?? Color.fromRGBO(255, 255, 255, 1),
        borderRadius: 4.rpx,
        borderWidth: 1.rpx,
        padding: EdgeInsets.symmetric(vertical: 3.rpx, horizontal: 10.rpx));
  }
}
