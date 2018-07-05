import 'package:flutter/material.dart';
import '../config/globalStyle.dart';

class ColType {
  int uid;
  String title;
  String desc;
  String imgSrc;
  String userName;

  ColType(this.uid, this.title, this.userName, this.desc, this.imgSrc);
}

class RecColumn extends StatelessWidget {
  final ColType _col;

  RecColumn(this._col);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        height: 160.0,
        constraints: BoxConstraints.expand(),
        decoration: new BoxDecoration(color: Colors.yellowAccent),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Container(
              height: 110.0,
              decoration: BoxDecoration(color: Colors.pink),
              child: new Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  new Center(
                    child: new Image.asset(
                      'lib/assets/football.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Positioned(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          _col.userName,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            new Container(
              child: new Text(_col.title),
            ),
            new Container(
              child: new Text(_col.desc),
            )
          ],
        ),
      ),
    );
  }
}

class Recommand extends StatefulWidget {
  @override
  State<Recommand> createState() {
    // TODO: implement createState
    return new _Recommand();
  }
}

class _Recommand extends State<Recommand> with TickerProviderStateMixin {
  List<String> _tabTitles;
  List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _tabTitles = <String>['全部', '魔兽', '怪物猎人', '生化危机'];
    List<Container> _cols = [
      new Container(
        height: 160.0,
        child: new RecColumn(new ColType(12341, '小鸟', 'title1', 'desc1', null)),
      ),
      new Container(
        height: 160.0,
        child: new RecColumn(new ColType(12342, '小鸟', 'title2', 'desc2', null)),
      ),
      new Container(
        height: 160.0,
        child: new RecColumn(new ColType(12343, '小鸟', 'title3', 'desc3', null)),
      ),
      new Container(
        height: 160.0,
        child: new RecColumn(new ColType(12344, '小鸟', 'title4', 'desc4', null)),
      ),
      new Container(
        height: 160.0,
        child: new RecColumn(new ColType(12345, '小鸟', 'title5', 'desc5', null)),
      ),
      new Container(
        height: 160.0,
        child: new RecColumn(new ColType(12346, '小鸟', 'title6', 'desc6', null)),
      ),
      new Container(
        height: 160.0,
        child: new RecColumn(new ColType(12347, '小鸟', 'title7', 'desc7', null)),
      ),
    ];

    _pages = <Widget>[
      // new Container(
      new ListView(
        scrollDirection: Axis.vertical,
        children: _cols,
      ),
      // new Container(
      new ListView(
        scrollDirection: Axis.vertical,
        children: _cols,
      ),
      // new Container(
      new ListView(
        scrollDirection: Axis.vertical,
        children: _cols,
      ),
      // new Container(
      new ListView(
        scrollDirection: Axis.vertical,
        children: _cols,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: _tabTitles.length,
        child: new Scaffold(
          appBar: new AppBar(
            title: const Text('Tabbed AppBar'),
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
            children: _pages.map((page) {
              return new Padding(
                padding: const EdgeInsets.all(16.0),
                child: page,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
