import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';
import '../../assets/hg_images.dart';

final List<BoxShadow> SPBoxShadow = [
  BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.1),
    blurRadius: 1.rpx,
    spreadRadius: 2.rpx,
  ),
];

/// 默认的boxShadow，用来修饰Container等
/// 你还可以扩展其他常用的阴影
/// 使用方式：
/*
Container(
  decoration: BoxDecoration(
    color: Colors.red,
    boxShadow: SPBoxShadow,
  ),
)
*/
