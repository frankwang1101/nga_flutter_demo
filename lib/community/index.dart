import 'package:flutter/material.dart';
import '../components/navigation_icon_view.dart';

class Community extends StatefulWidget {
  @override
  State<Community> createState() {
    // TODO: implement createState
    return new _Community();
  }
}

class _Community extends State<Community> with TickerProviderStateMixin {
  int _currentIndex;
  List<Text> _tabTitles;
  List<NavigationIconView> _icons;
  List<Widget> _tabs;
  Widget _currentTab;

  @override
    void initState() {
      super.initState();
      _tabTitles = <Text>[
        new Text('我的收藏'),
        new Text('网游单机'),
        new Text('手游页游'),
        new Text('网事杂谈'),
      ];
      _tabs = [
        new Center(
          child: new Column(
            children: <Widget>[
              new Text('长按拖动可以修改排序'),
              new Align(
                child: getIcons([], _tabTitles),
              )
            ],
          ),
        ),
        new Center(
          child: new Column(
            children: <Widget>[
              new Text('热门推荐'),
              new Align(
                child: getIcons([], _tabTitles),
              ),
              new Text('暴雪游戏'),
              new Align(
                child: getIcons([], _tabTitles),
              ),
            ],
          ),
        ),
        new Center(
          child: new Column(
            children: <Widget>[
              new Text('网页游戏'),
              new Align(
                child: getIcons([], _tabTitles),
              ),
              new Text('手机游戏'),
              new Align(
                child: getIcons([], _tabTitles),
              ),
            ],
          ),
        ),
        new Center(
          child: new Column(
            children: <Widget>[
              new Text('精选'),
              new Align(
                child: getIcons([], _tabTitles),
              ),
              new Text('软硬件'),
              new Align(
                child: getIcons([], _tabTitles),
              ),
            ],
          ),
        ),
      ];
      _icons = <NavigationIconView>[];
      _currentTab = _tabs[_currentIndex];
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(home: null);
  }
}

getIcons(List<int> keys, List list) {
  return keys.map((key) => list[key]).toList();
}
