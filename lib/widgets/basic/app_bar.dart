import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';
import '../../assets/hg_images.dart';

class SPAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size preferredSize;
  final Widget child;
  final Color backgroundColor;
  final PreferredSizeWidget bottom;

  final double elevation;

  /// 定义我们的顶导的高度，跟flutter的appbar高度一致
  /// 目前是因为使用了SliverAppBar，而SliverAppBar不能设置高度
  static final double _appBarHeight = SPUI.appBarHeight;

  SPAppBar({
    Key key,
    this.child,
    Color backgroundColor,
    this.bottom,
    this.elevation,
  })  : preferredSize = Size.fromHeight(
            _appBarHeight + (bottom?.preferredSize?.height ?? 0.0)),
        this.backgroundColor = backgroundColor,
        super(key: key);

  // 自定义child 重写这里！！！
  Widget renderChild(BuildContext context) {
    return child;
  }

  Widget renderContent(BuildContext context) {
    if (bottom != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(height: _appBarHeight, child: renderChild(context)),
          Container(height: bottom?.preferredSize?.height, child: bottom),
        ],
      );
    } else {
      return renderChild(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      // elevation: elevation ?? 4.0,
      child: Container(
        // AppBar总高度
        height: SPUI.statusBarHeight +
            _appBarHeight +
            (bottom?.preferredSize?.height ?? 0.0),
        // 上面的留白，空出手机状态栏
        padding: EdgeInsets.only(top: SPUI.statusBarHeight),
        // 修饰
        decoration: BoxDecoration(
          // 如果不指定颜色，就是用primaryColor
          color: backgroundColor ?? theme.primaryColor,
          // boxShadow: SPBoxShadow,
        ),
        // AppBar内容
        child: renderContent(context),
      ),
    );
  }
}

// 顶部导航栏 带两侧按钮
class SPAppBarWithSides extends SPAppBar {
  final Widget title;
  final Widget left;
  final Widget right;

  SPAppBarWithSides({
    Key key,
    Color backgroundColor,
    PreferredSizeWidget bottom,
    this.title,
    this.left,
    this.right,
    double elevation,
  }) : super(
          backgroundColor: backgroundColor,
          key: key,
          bottom: bottom,
          elevation: elevation,
        );

  @override
  Widget renderChild(BuildContext context) {
    // 为了使title不受两侧内容的影响，保持居中，
    // 设置为两层的内容
    return Stack(
      children: [
        // 中间title的内容
        Container(
          child: Center(child: title),
        ),
        // 两侧的按钮
        Container(
          child: Row(
            children: <Widget>[
              Container(
                child: left,
              ),
              Spacer(),
              Container(
                child: right,
              )
            ],
          ),
        ),
      ],
    );
  }
}

// 顶部导航栏左侧是返回按钮，中间是标题文字，右侧可以自定义
class SPAppBarWithSidesTitleAndBackButton extends SPAppBarWithSides {
  SPAppBarWithSidesTitleAndBackButton({
    Key key,
    Color backgroundColor,
    PreferredSizeWidget bottom,
    SPAppBarTitle title,
    Widget right,
    double elevation,
  }) : super(
          backgroundColor: backgroundColor,
          key: key,
          bottom: bottom,
          left: SPAppBarBackButton(),
          right: right,
          title: title,
          elevation: elevation,
        );
}

// 顶部导航栏 带两侧按钮（按钮可以为空）
class SPAppBarWithSidesExpandedCenter extends SPAppBar {
  final Widget child;
  final Widget left;
  final Widget right;

  SPAppBarWithSidesExpandedCenter({
    Key key,
    this.child,
    this.left,
    this.right,
    Color backgroundColor,
    PreferredSizeWidget bottom,
    double elevation,
  }) : super(
          key: key,
          backgroundColor: backgroundColor,
          bottom: bottom,
          elevation: elevation,
        );

  @override
  Widget renderChild(BuildContext context) {
    return Row(
      children: <Widget>[
        if (left != null)
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 20.rpx),
            child: left,
          ),
        // SizedBox(width: 20.rpx),
        Expanded(
          child: child != null ? child : SPAppBarTitle(),
        ),
        if (right != null)
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 20.rpx),
            child: right,
          )
      ],
    );
  }
}

class SPAppBarWithLogo extends SPAppBar {
  final Widget child;
  final PreferredSizeWidget bottom;
  SPAppBarWithLogo({
    Key key,
    this.bottom,
    this.child,
    double elevation,
  }) : super(
          key: key,
          bottom: bottom,
          elevation: elevation,
        );

  @override
  Widget renderChild(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.rpx),
      child: Row(
        textBaseline: TextBaseline.alphabetic,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 64.rpx,
            child: Image.asset(
              HGImages.navbarLogo,
              width: 174.rpx,
              height: 64.rpx,
            ),
          ),
          Expanded(
            child: Container(child: child),
          ),
        ],
      ),
    );
  }
}

class SPAppBarTitle extends StatelessWidget {
  final String title;
  final TextStyle style;

  SPAppBarTitle({Key key, this.title, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      "${title ?? '汉光百货'}",
      textAlign: TextAlign.center,
      style: style ?? theme.textTheme.headline1,
    );
  }
}

/// 顶部导航栏的返回按钮
class SPAppBarBackButton extends StatelessWidget {
  final Color backgroundColor;

  SPAppBarBackButton({
    Key key,
    this.backgroundColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: SPAppBar._appBarHeight,
      padding: EdgeInsets.symmetric(horizontal: 20.rpx),
      alignment: Alignment.centerLeft,
      // padding: EdgeInsets.symmetric(horizontal: 20.rpx),
      child: Center(
        child: CircleAvatar(
          backgroundColor: backgroundColor ?? Colors.transparent,
          // backgroundColor: Colors.grey.withOpacity(1),
          // height: 50.rpx,
          // width: 50.rpx,
          child: BackButton(
            color: theme.cardColor,
            // padding: EdgeInsets.zero,
            // icon: Icon(
            //   Icons.arrow_back,
            //   color: theme.cardColor,
            //   // size: 40.rpx,
            // ),
            // onPressed: () {
            //   Navigator.pop(context);
            // },
          ),
        ),
      ),
      // alignment: Alignment.centerLeft,
    );
  }
}

// AppBar下面的组件容器，与AppBar连在一起展示，���如列表页顶部的筛选、排序等按钮
class SPAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  final Size preferredSize;
  final Color backgroundColor;
  final Widget child;

  SPAppBarBottom({Key key, this.child, Color backgroundColor, double height})
      : preferredSize = Size.fromHeight(height ?? SPUI.barHeight),
        this.backgroundColor = backgroundColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: backgroundColor ?? theme.cardColor,
      child: child,
    );
  }
}
