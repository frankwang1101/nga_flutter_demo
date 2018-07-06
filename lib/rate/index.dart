import 'package:flutter/material.dart';
import '../config/globalStyle.dart';
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

  RateType(this.rank, this.rate, this.name, this.url, this.releaseTime,
      this.consoles);
}

class RateComponent1 extends StatelessWidget {
  RateType _info;

  RateComponent1(this._info);
  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 130.0,
        margin: EdgeInsets.only(right: 15.0),
        child: new Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            new Container(
              // decoration: BoxDecoration(color: Colors.pink),
              child: new Column(
                children: <Widget>[
                  new Container(
                    height: 20.0,
                    // decoration: boxGrey,
                    width: 210.0,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Padding(child: new Text('NO.${_info.rank}'), padding: EdgeInsets.only(right: 3.0),),
                        new Text('${_info.rate}分'),
                      ],
                    ),
                  ),
                  new Image(
                    image: new NetworkImage(_info.url),
                    height: 110.0,
                    width: 210.0,
                  ),
                ],
              ),
            ),
            new Positioned(
              width: 210.0,
              child: new Text(
                _info.name,
                textAlign: TextAlign.center,
                style: new TextStyle(color: Colors.white),
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
      height: 100.0,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Stack(
            children: <Widget>[
              new Container(
                child: new Image(
                  image: new NetworkImage(_info.url),
                  width: 180.0,
                ),
              ),
              new Positioned(
                child: new Container(
                  decoration: BoxDecoration(color: Colors.yellow),
                  padding: EdgeInsets.all(5.0),
                  child: new Text(_info.rate.toString(), style: TextStyle(fontSize: 16.0),),
                  // width: 180.0,
                ),
                top: 0.0,
                left: 0.0,
              )
            ],
          ),
          new Container(
            width: 160.0,
            height: 80.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text(
                  _info.name,
                ),
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
    return new Container(
      height: MediaQuery.of(context).size.height - 200.0,
      child: new Column(
        children: <Widget>[
          new Container(
              height: 130.0,
              // width: 360.0,

              child: new ListView(
                scrollDirection: Axis.horizontal,
                children: genData(1, 8),
              )),
          new Expanded(
              // height: 300.0,
              // width: 360.0,
              child: new ListView(
            children: genData(2, 8),
          ))
        ],
      ),
    );
  }
}

class _Rate extends State<Rate> with TickerProviderStateMixin {
  List<Widget> _tabs;
  List<String> _tabTitles;

  @override
  void initState() {
    super.initState();
    _tabs = [
      new RateLayout(1),
      new RateLayout(1),
      new RateLayout(1),
      // new Container( decoration: BoxDecoration(border: new Border.all(width: 1.0, color:Colors.indigo)), child: new Center( child: new Text('word'),),),
      // new Container( decoration: BoxDecoration(border: new Border.all(width: 1.0, color:Colors.indigo)), child: new Center( child: new Text('word'),),),
      // new Container( decoration: BoxDecoration(border: new Border.all(width: 1.0, color:Colors.indigo)), child: new Center( child: new Text('word'),),),
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
            children: _tabs
                .map((tab) => new Padding(
                      padding: EdgeInsets.all(10.0),
                      child: tab,
                    ))
                .toList()),
      ),
    ));
  }
}

genData([type = 1, n = 4]) {
  List<RateType> types = [];
  for (int i = 0; i < n; i++) {
    RateType type = new RateType(rate[i]["rank"], rate[i]["rate"],
        rate[i]["name"], rate[i]["url"], rate[i]["date"], null);
    types.add(type);
  }
  if (type == 1) {
    return types.map((type) => new RateComponent1(type)).toList();
  }
  return types.map((type) => new RateComponent2(type)).toList();
}
