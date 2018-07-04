import 'package:flutter/material.dart';

class Rate extends StatefulWidget {
  @override
  State<Rate> createState() {
    // TODO: implement createState
    return new _Rate();
  }
}

class RateType {
  int rank;
  double rate;
  String name;
  String url;
  DateTime releaseTime;
  List<int> consoles;

  RateType(this.rank, rate, name, url, releaseTime, consoles);
}

class RateComponent1 extends StatelessWidget {
  RateType _info;

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Stack(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Text('NO.${_info.rank}'),
                new Text('${_info.rate}分'),
              ],
            ),
            new Image.asset(_info.url),
          ],
        ),
        new Positioned(
          child: new Text(
            _info.name,
            textAlign: TextAlign.center,
          ),
          bottom: 0.0,
          left: 0.0,
        )
      ],
    ));
  }
}

class RateComponent2 extends StatelessWidget {
  RateType _info;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Row(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              new Container(
                child: new Image.asset(_info.url),
              ),
              new Positioned(
                child: new Container(
                  decoration: BoxDecoration(color: Colors.yellow),
                  child: new Text(_info.name),
                ),
                top: 0.0,
                left: 0.0,
              )
            ],
          ),
          new Container(
            child: Row(
              children: <Widget>[
                new Text(_info.name),
                new Text(_info.releseTime.toString())
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RateLayout extends StatelessWidget {
  int type;
  RateLayout(this.type);
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[],
            ),
          ),
          // new Container(), // TODO:
          new Container(),
        ],
      ),
    );
  }
}

class _Rate extends State<Rate> with TickerProviderStateMixin {
  List<Widget> _tabs;
  List<String> _tabTitles;
  int _currentTab;

  @override
  void initState() {
    super.initState();
    _tabs = [new RateLayout(1)];
    _tabTitles = [
      '主机游戏',
      '手机游戏',
      'PC游戏',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('评分'),
          bottom: new TabBar(
            tabs: _tabTitles
                .map((String title) => new Tab(
                      text: title,
                    ))
                .toList(),
          ),
        ),
        body: new TabBarView(
          children: _tabs,
        ),
      ),
    );
  }
}
