import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';
import '../../assets/hg_images.dart';

abstract class SPState<T extends StatefulWidget> extends State<T> {
  // 获得父类的全局变量
  T get widget => super.widget;

  BuildContext get context => super.context;

  @override
  void setState([VoidCallback fn]) {
    if (!mounted) return;
    super.setState(fn ?? () {});
  }
}

abstract class SPStateKeepAlive<T extends StatefulWidget> extends SPState<T>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  // 获得父类的全局变量
  T get widget => super.widget;

  BuildContext get context => super.context;
}
