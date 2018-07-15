import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nga_flutter/components/globalState.dart';
import '../config/globalStyle.dart';
import '../columns/column.dart';
import '../components/common.dart';
import '../columns/postDetail.dart';
import './iconAssets.dart';

class Community extends StatefulWidget {
  @override
  State<Community> createState() {
    return new _Community();
  }
}

class ColumnIcon extends StatelessWidget {
  final String text;
  final String imgSrc;
  BuildContext pctx;

  ColumnIcon(this.text, this.imgSrc, this.pctx);

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: 80.0,
        margin: EdgeInsets.only(top: 15.0),
        child: new FlatButton(
          onPressed: () {
            Navigator.push(pctx, new MaterialPageRoute(builder: (context) {
              return new ColumnPage();
            }));
          },
          child: new Column(
            children: <Widget>[
              new Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: new Image(
                  image: new NetworkImage(imgSrc),
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                ),
              ),
              new Text(
                text,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}

class _Community extends State<Community> with TickerProviderStateMixin {
  int _currentIndex;
  List<String> _tabTitles;
  List<ColumnIcon> _icons;
  List<Widget> _tabs;
  GlobalState _gl = GlobalState.instance;
  StreamSubscription _stateSub;

  @override
  void initState() {
    super.initState();
    _tabTitles = <String>[
      '我的收藏',
      '网游单机',
      '手游页游',
      '网事杂谈',
    ];
    _icons = iconAssets.map(
      (asset){
        return new ColumnIcon(asset["label"], asset["iconSrc"], context);
      }
    ).toList();
    _tabs = [
      new Container(
        decoration: boxGrey,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              '长按拖动可以修改排序',
              textAlign: TextAlign.left,
            ),
            new Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: getIcons([14, 0, 16, 7, 2, 6, 3, 4], _icons),
            )
          ],
        ),
      ),
      new Container(
        decoration: boxGrey,
        child: new Column(
          children: <Widget>[
            new Text('热门推荐'),
            new Column(
              children: getIcons([0, 1, 2, 3], _icons),
            ),
            new Text('暴雪游戏'),
            new Column(
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
            new Column(
              children: getIcons([5, 6, 7, 8], _icons),
            ),
            new Text('手机游戏'),
            new Column(
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
            new Column(
              children: getIcons([16, 15, 14, 13], _icons),
            ),
            new Text('软硬件'),
            new Column(
              children: getIcons([12, 11, 10, 9], _icons),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _gl.set("community", "100");
    print(_gl);
    return new MaterialApp(
        home: new DefaultTabController(
      length: _tabs.length,
      child: new Scaffold(
        backgroundColor: ybgc,
        appBar: commonAppBar(_tabTitles, false),
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
  int l = keys.length;
  int n = (l / 4).ceil();
  List<Row> result = [];
  for (int i = 0; i < n; i++) {
    int end = ((i + 1) * 4 > keys.length) ? keys.length : ((i + 1) * 4);
    result.add(new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: keys.getRange(i * 4, end).map((key) => list[key]).toList(),
    ));
  }
  return result;
}
