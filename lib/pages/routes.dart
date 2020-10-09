import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './login_page/login_page.dart';

// 打开新页面
Future<T> _push<T>(
  BuildContext context,
  Widget Function(BuildContext) builder,
) async {
  print("跳转");
  return Navigator.of(context).push<T>(
    CupertinoPageRoute<T>(
      builder: builder,
    ),
  );
}

// 替换原页面打开新页面
Future _replace(
  BuildContext context,
  Widget Function(BuildContext) builder,
) async {
  return Navigator.of(context).pushReplacement(
    CupertinoPageRoute(
      builder: builder,
    ),
  );
}

// 这样写有好处，可以直接跳转；
// 但是由于flutter不支持反射，如果用户从通知中心点击打开App，这时想要跳转到某个页面，需要。
class HGRoutes {
  /// 首页（5屏：首页、分类页、品牌页、购物车、个人中心）
  /// NOTICE
  /// 首页是App最基础的页面，存在于页面栈的最底层，不要再打开首页了
  /// 首页5屏中只有购物车会再单独打开，已做单独处理
  /// 其他页面都是在首页的基础上打开的，如果想看到首页，必须关掉其他页面，回到首页。
  // static home(BuildContext context) => {_push(context, (_) => HomePage())};
  // static userCenter(BuildContext context) => _push(context, (_) => UserCenterPage());

  /// *******用户部分********
  // 登录
  static Future login(BuildContext context) {
    return _push(context, (_) => LoginPage());
  }
}
