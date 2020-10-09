import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';
import '../../assets/hg_images.dart';

class SPPrice extends StatelessWidget {
  SPPrice({
    Key key,
    unitSize,
    unitHeight,
    unitWeight,
    priceWeight,
    priceSize,
    priceHeight,
    color,
    unit,
    @required price,
    lineThrough,
    gap,
  }) {
    this.unitSize = unitSize ?? 22.rpx;
    this.unitHeight = unitHeight;
    this.unitWeight = unitWeight;
    this.priceWeight = priceWeight;
    this.priceSize = priceSize ?? 22.rpx;
    this.priceHeight = priceHeight;
    this.price = price;
    this.color = color ?? Colors.black;
    this.lineThrough = lineThrough ?? false;
    this.gap = gap ?? 1;
    this.unit = unit ?? '¥';
  }

  /// 价格前面的单位符号的字号
  double unitSize;

  /// 价格前面的单位符号的高度
  double unitHeight;

  /// 价格前面的单位符号的字重
  FontWeight unitWeight;

  /// 价格的字号
  double priceSize;

  /// 价格的高度
  double priceHeight;

  /// 价格的字重
  FontWeight priceWeight;

  /// 价格组件的颜色
  Color color;

  /// 具体价格
  String price;

  /// 是否有中划线，默认没有中划线
  bool lineThrough;

  /// 价格和单位之间的间隙距离
  double gap;

  /// 设置单位
  String unit;

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      text: TextSpan(
        text: this.unit,
        style: TextStyle(
          fontSize: this.unitSize,
          color: this.color,
          height: (this.unitHeight ?? this.unitSize) / this.unitSize,
        ),
        children: [
          TextSpan(
            text: this.price,
            style: TextStyle(
              fontSize: this.priceSize,
              color: this.color,
              decoration: this.lineThrough ? TextDecoration.lineThrough : null,
              decorationColor: this.color,
              fontWeight: this.priceWeight,
              height: (this.priceHeight ?? this.priceSize) / this.priceSize,
            ),
          ),
        ],
      ),
    );
  }
}
