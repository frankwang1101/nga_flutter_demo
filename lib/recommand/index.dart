import 'package:flutter/material.dart';
import '../config/globalStyle.dart';

class ColType {
  int uid;
  String title;
  String desc;
  String imgSrc;

  ColType(this.uid, this.title, this.desc, this.imgSrc);
}

class RecColumn extends StatelessWidget {
  final ColType _col;

  RecColumn(this._col);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Image.asset('lib/assets/football.png'),
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
        height: 80.0,
        child: new RecColumn(new ColType(12341, 'title1', 'desc1', null)),
        decoration: boxGrey,
      ),
      new Container(
        height: 80.0,
        child: new RecColumn(new ColType(12342, 'title2', 'desc2', null)),
        decoration: boxGrey,
      ),
      new Container(
        height: 80.0,
        child: new RecColumn(new ColType(12343, 'title3', 'desc3', null)),
        decoration: boxGrey,
      ),
      new Container(
        height: 80.0,
        child: new RecColumn(new ColType(12344, 'title4', 'desc4', null)),
        decoration: boxGrey,
      ),
      new Container(
        height: 80.0,
        child: new RecColumn(new ColType(12345, 'title5', 'desc5', null)),
        decoration: boxGrey,
      ),
      new Container(
        height: 80.0,
        child: new RecColumn(new ColType(12346, 'title6', 'desc6', null)),
        decoration: boxGrey,
      ),
      new Container(
        height: 80.0,
        child: new RecColumn(new ColType(12347, 'title7', 'desc7', null)),
        decoration: boxGrey,
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
