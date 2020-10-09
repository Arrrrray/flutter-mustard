import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';
import '../../assets/hg_images.dart';
import '../../assets/hg_icons.dart';

class SPCardImage extends StatelessWidget {
  const SPCardImage(
      {Key key,
      this.width,
      this.imageUrl,
      this.borderRadius,
      this.soldOut: false})
      : super(key: key);

  /// 卡片的图片
  final double width;

  /// 图片的圆角
  final BorderRadius borderRadius;

  /// 图片的地址
  final String imageUrl;

  /// 是否售罄，如果售罄，则显示售罄的图标
  final bool soldOut;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
            borderRadius: this.borderRadius,
            child: FadeInImage.assetNetwork(
              placeholder: HGImages.imagePlaceholder,
              image: this.imageUrl,
              fit: BoxFit.fill,
              width: this.width,
              height: this.width,
            )),
        Positioned(
          top: 20.rpx,
          left: 20.rpx,
          child: this.soldOut
              ? Container(
                  width: 80.rpx,
                  height: 80.rpx,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80.rpx),
                      color: Colors.black12),
                  child: Icon(
                    HGIcons.LOGO,
                    size: 40.rpx,
                    color: Colors.white,
                  ))
              : Container(child: null),
        )
      ],
    );
  }
}
