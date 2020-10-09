import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';
import '../../assets/hg_images.dart';

/// 带红线的标题区块
// 使用位置：商品详情页、分类页
class SPLineTitle extends StatelessWidget {
  final String title;
  final double lineLength;
  const SPLineTitle(
    this.title, {
    Key key,
    this.lineLength,
  }) : super(key: key);

  Widget _renderLine() {
    return Expanded(
      child: Container(
        height: 80.rpx,
        alignment: Alignment.center,
        child: Container(
          height: 2.rpx,
          color: Color(0xffb21b1b),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100.rpx),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _renderLine(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.rpx),
            height: 80.rpx,
            alignment: Alignment.center,
            child: Text(
              '$title',
              style: theme.textTheme.headline4,
            ),
          ),
          _renderLine(),
        ],
      ),
    );
  }
}
