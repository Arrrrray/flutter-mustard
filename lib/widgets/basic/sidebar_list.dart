import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';
import '../../assets/hg_images.dart';

typedef Widget SidebarBuilder(BuildContext context, int index);

class SidebarListItem {
  String title;

  SidebarListItem({this.title});
}

class SidebarList extends StatefulWidget {
  final int initIndex;
  final double sidebarWidth; // 左侧导航栏宽度。
  final SidebarBuilder builder;
  final List<SidebarListItem> items;
  SidebarList({
    Key key,
    this.builder,
    this.items,
    this.initIndex,
    this.sidebarWidth,
  }) : super(key: key);

  @override
  _SidebarListState createState() => _SidebarListState();
}

class _SidebarListState extends State<SidebarList> {
  int _currentIndex = -1;
  List<SidebarListItem> _items = [];

  @override
  void initState() {
    super.initState();
    _items = widget.items;

    // 设置索引
    if (_items.length > 0) {
      _currentIndex = widget.initIndex ?? 0;
    }
  }

  Widget getTabItem(int index, SidebarListItem item) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        height: SPUI.barHeight,
        decoration: BoxDecoration(
          color: _currentIndex == index
              ? theme.cardColor
              : theme.scaffoldBackgroundColor,
          border: _currentIndex == index
              ? Border(
                  left: BorderSide(
                    color: theme.accentColor,
                    style: BorderStyle.solid,
                    width: 6.rpx,
                  ),
                )
              : null,
        ),
        child: Center(
          child: Text(
            item.title,
            style: TextStyle(
              fontSize: 26.rpx,
              fontWeight:
                  _currentIndex == index ? FontWeight.w600 : FontWeight.w400,
              color: _currentIndex == index
                  ? theme.accentColor
                  : Color.fromRGBO(85, 85, 85, 1),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Row(
        children: <Widget>[
          // sider 左侧小导航
          Container(
            width: widget.sidebarWidth ?? 160.rpx,
            color: theme.scaffoldBackgroundColor,
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.rpx),
              itemCount: _items.length,
              itemBuilder: (BuildContext context, int index) {
                return getTabItem(index, _items[index]);
              },
            ),
          ),
          // 右侧主体内容
          Expanded(
            child: Container(
              child: widget.builder(context, _currentIndex),
            ),
          ),
        ],
      ),
    );
  }
}
