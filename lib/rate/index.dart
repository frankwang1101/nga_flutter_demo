import 'package:flutter/material.dart';
import '../config/mock.dart';

class Rate extends StatefulWidget {
  @override
  State<Rate> createState() {
    return new _Rate();
  }
}

class RateType {
  int rank;
  double rate;
  String name;
  String url;
  String releaseTime;
  List<int> consoles;

  RateType(this.rank, this.rate, this.name, this.url, this.releaseTime, this.consoles);
}

class RateComponent1 extends StatelessWidget {
  RateType _info;

  RateComponent1(this._info);
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Text('NO.${_info.rank}'),
                new Text('${_info.rate}分'),
              ],
            ),
            new Image(image: new NetworkImage(_info.url)),
          ],
        ),
        new Positioned(
          child: new Text(
            _info.name,
            textAlign: TextAlign.center,
          ),

        )
      ],
    ));
  }
}

class RateComponent2 extends StatelessWidget {
  RateType _info;

  RateComponent2(this._info);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Row(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              new Container(
                child: new Image(
                  image: new NetworkImage(_info.url),
                ),
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
                new Text(_info.releaseTime.toString())
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
              children: genData(),
            ),
          ),
          // new Container(), // TODO:
          new Container(
            child: new Column(
              children: <Widget>[
                new ListView(
                  children: genData(2),
                )
              ],
            ),
          ),
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
    _tabs = [
      new RateLayout(1),
      new RateLayout(1),
      new RateLayout(1),
    ];
    _tabTitles = [
      '主机游戏',
      '手机游戏',
      'PC游戏',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new DefaultTabController(
      length: _tabs.length,
      child: new Scaffold(
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
    ));
  }
}

genData([type = 1, n = 4]){
  List<RateType> types = [];
  for(int i=0;i<n;i++){
    RateType type = new RateType(rate[i]["rank"], rate[i]["rate"], rate[i]["name"], rate[i]["url"], rate[i]["date"], null);
    print(type.url);
    types.add(
      type
    );
  }
  if (type == 1){
    return types.map((type) => new RateComponent1(type)).toList();
  }
  return types.map((type) => new RateComponent2(type)).toList();
}
