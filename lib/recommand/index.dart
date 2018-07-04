import 'package:flutter/material.dart';

class Recommand extends StatefulWidget {
  @override
  State<Recommand> createState() {
    return null;
  }
}

class ColType {
  int uid;
  String title;
  String desc;
  String imgSrc;

  ColType(this.uid, this.title, this.desc, this.imgSrc);
}

class RecColumn extends StatelessWidget {
  ColType _col;

  RecColumn(this._col);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Container(
            child: new Image.asset(_col.imgSrc),
          ),
          new Container(
            child: new Text(_col.title),
          ),
          new Container(
            child: new Text(_col.desc),
          )
        ],
      ),
    );
  }
}

class _Recommand extends State<Recommand> with TickerProviderStateMixin {
  List<RecColumn> _cols;
  List<String> _tabTitles;
  List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _cols = [
      new RecColumn(new ColType(12341, 'title1', 'desc1', null)),
      new RecColumn(new ColType(12342, 'title2', 'desc2', null)),
      new RecColumn(new ColType(12343, 'title3', 'desc3', null)),
      new RecColumn(new ColType(12344, 'title4', 'desc4', null)),
      new RecColumn(new ColType(12345, 'title5', 'desc5', null)),
      new RecColumn(new ColType(12346, 'title6', 'desc6', null)),
      new RecColumn(new ColType(12347, 'title7', 'desc7', null)),
    ];
    _tabTitles = [
      '全部',
      '魔兽',
      '怪物猎人',
      '生化危机',
    ];
    _tabs = [
      new Center(
        child: new ListView(
          children: _cols,
        ),
      ),
      new Center(
        child: new ListView(
          children: _cols,
        ),
      ),
      new Center(
        child: new ListView(
          children: _cols,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new DefaultTabController(
      child: new Scaffold(
        appBar: new AppBar(
          bottom: new TabBar(
            isScrollable: true,
            tabs: _tabTitles.map((String title) {
              return new Tab(
                text: title,
              );
            }).toList(),
          ),
        ),
        body: new TabBarView(
          children: _tabs,
        ),
      ),
    ));
  }
}
