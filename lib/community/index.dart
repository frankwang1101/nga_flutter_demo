import 'package:flutter/material.dart';
import '../config/globalStyle.dart';

class Community extends StatefulWidget {
  @override
  State<Community> createState() {
    // TODO: implement createState
    return new _Community();
  }
}

class ColumnIcon extends StatelessWidget {
  final String text;
  final String imgSrc;

  ColumnIcon(this.text, this.imgSrc);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Image(
            image: new NetworkImage(imgSrc),
          ),
          new Text(text)
        ],
      ),
    );
  }
}

class _Community extends State<Community> with TickerProviderStateMixin {
  int _currentIndex;
  List<String> _tabTitles;
  List<ColumnIcon> _icons;
  List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabTitles = <String>[
      '我的收藏',
      '网游单机',
      '手游页游',
      '网事杂谈',
    ];
    _icons = <ColumnIcon>[
      new ColumnIcon('网事杂谈',
          'http://img4.nga.178.com/ngabbs/nga_classic/f/354.png.invert.png'),
      new ColumnIcon(
          '大旋涡博物馆', 'http://img4.nga.178.com/ngabbs/nga_classic/f/-187579.png'),
      new ColumnIcon('二次元国家地理',
          'http://img4.nga.178.com/ngabbs/nga_classic/f/-447601.png'),
      new ColumnIcon(
          '模玩之魂', 'http://img4.nga.178.com/ngabbs/nga_classic/f/-84.png'),
      new ColumnIcon(
          '小窗视界', 'http://img4.nga.178.com/ngabbs/nga_classic/f/-8725919.png'),
      new ColumnIcon(
          '寂寞的车', 'http://img4.nga.178.com/ngabbs/nga_classic/f/-343809.png'),
      new ColumnIcon(
          '音乐 影视', 'http://img4.nga.178.com/ngabbs/nga_classic/f/00.png'),
      new ColumnIcon(
          '生命之杯', 'http://img4.nga.178.com/ngabbs/nga_classic/f/-81981.png'),
      new ColumnIcon(
          '篮球', 'http://img4.nga.178.com/ngabbs/nga_classic/f/485.png'),
      new ColumnIcon(
          '时尚消费', 'http://img4.nga.178.com/ngabbs/nga_classic/f/00.png'),
      new ColumnIcon(
          '母婴育儿', 'http://img4.nga.178.com/ngabbs/nga_classic/f/00.png'),
      new ColumnIcon(
          '宠物养成', 'http://img4.nga.178.com/ngabbs/nga_classic/f/-353371.png'),
      new ColumnIcon(
          '发烧友', 'http://img4.nga.178.com/ngabbs/nga_classic/f/00.png'),
      new ColumnIcon(
          '程序员职业交流', 'http://img4.nga.178.com/ngabbs/nga_classic/f/00.png'),
      new ColumnIcon(
          '消费电子', 'http://img4.nga.178.com/ngabbs/nga_classic/f/00.png'),
      new ColumnIcon(
          'IT新闻', 'http://img4.nga.178.com/ngabbs/nga_classic/f/124.png'),
      new ColumnIcon(
          '硬件配置', 'http://img4.nga.178.com/ngabbs/nga_classic/f/102.png'),
      new ColumnIcon(
          '二手交易', 'http://img4.nga.178.com/ngabbs/nga_classic/f/-4567100b.png'),
    ];
    _tabs = [
      new Container(
        decoration: boxGrey,
        child: new Column(
          children: <Widget>[
            new Text('长按拖动可以修改排序'),
            new Row(
              children: getIcons([14, 0, 16, 7], _icons),
            )
          ],
        ),
      ),
      new Container(
        decoration: boxGrey,
        child: new Column(
          children: <Widget>[
            new Text('热门推荐'),
            new Row(
              children: getIcons([0, 1, 2, 3], _icons),
            ),
            new Text('暴雪游戏'),
            new Row(
              children: getIcons([7, 8, 9, 10], _icons),
            ),
          ],
        ),
      ),
      new Container(
        decoration: boxGrey,
        child: new Column(
          children: <Widget>[
            new Text('网页游戏'),
            new Row(
              children: getIcons([5, 6, 7, 8], _icons),
            ),
            new Text('手机游戏'),
            new Row(
              children: getIcons([9, 10, 1, 2], _icons),
            ),
          ],
        ),
      ),
      new Container(
        decoration: boxGrey,
        child: new Column(
          children: <Widget>[
            new Text('精选'),
            new Row(
              children: getIcons([16, 15, 14, 13], _icons),
            ),
            new Text('软硬件'),
            new Row(
              children: getIcons([12, 11, 10, 9], _icons),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        home: new DefaultTabController(
      length: _tabs.length,
      child: new Scaffold(
        backgroundColor: ybgc,
        appBar: new AppBar(
          // title: const Text('Tabbed AppBar'),
          bottom: new TabBar(
            isScrollable: true,
            tabs: _tabTitles.map((title) {
              return new Tab(text: title);
            }).toList(),
          ),
        ),
        body: new TabBarView(
          children: _tabs.map((tab) {
            return new Padding(
              padding: const EdgeInsets.all(12.0),
              child: tab,
            );
          }).toList(),
        ),
      ),
    ));
  }
}

getIcons(List<int> keys, List<ColumnIcon> list) {
  print(keys);

  List<ColumnIcon> r = keys.map((key){
    print(key);
    print(list[key]);
    var m = list[key];
    return m;

    }).toList();
  return r;
}
