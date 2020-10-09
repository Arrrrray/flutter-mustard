/// 没有数据时显示的页面。
import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';
import '../../assets/hg_icons.dart';

class NoDataWidget extends StatelessWidget {
  final String message;
  final double marginTop;

  NoDataWidget({
    Key key,
    this.message,
    this.marginTop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: this.marginTop ?? 150.rpx),
            width: 140.rpx,
            height: 140.rpx,
            child: Icon(
              HGIcons.noorder,
              size: 140.rpx,
              color: rgba(218, 218, 218, 1),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.rpx),
            child: Text(
              this.message ?? '暂时没有此类数据',
              style: TextStyle(
                fontSize: 28.rpx,
                color: rgba(202, 202, 202, 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}
