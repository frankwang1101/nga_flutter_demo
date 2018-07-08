import 'package:flutter/material.dart';
import '../config/globalStyle.dart';
import './assetMap.dart';
import 'package:flutter/services.dart';

class Personal extends StatefulWidget {
  @override
  State<Personal> createState() {
    return new _Personal();
  }
}

class LabelContainer extends StatelessWidget {
  IconData icon;
  String title;
  LabelContainer(this.icon, this.title);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 40.0,
      padding: EdgeInsets.only(left: 18.0),
      child: new Row(
        children: <Widget>[
          new Icon(
            icon,
            color: rgb(18, 183, 245),
          ),
          new Container(
            margin: EdgeInsets.only(left: 4.0),
            child: new Text(
              title,
              style: TextStyle(fontSize: 16.0, color: rgb(50,50,50)),
            ),
          )
        ],
      ),
    );
  }
}

class _Personal extends State<Personal> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            backgroundColor: ybgc,
            body: new Center(
                child: new Stack(
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Container(
                      height: 20.0,
                    ),
                    new Container(
                      height: 102.0,
                      padding: EdgeInsets.all(16.0),
                      // width: 400.0,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Container(
                            height: 70.4,
                            width: 70.4,
                            child: new Image.asset('lib/assets/football.png'),
                          ),
                          new Expanded(
                            child: new Container(
                              margin: EdgeInsets.only(left: 10.0),
                              padding: EdgeInsets.only(top: 9.0, bottom: 9.0),
                              child: new Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                    'username',
                                    style: new TextStyle(
                                        color: Colors.black, fontSize: 24.0),
                                  ),
                                  new Text(
                                    '24005061',
                                    style: new TextStyle(
                                        color: rgb(183, 180, 173, 1.0),
                                        fontSize: 16.0),
                                  )
                                ],
                              ),
                            ),
                          ),
                          new Icon(Icons.arrow_right),
                        ],
                      ),
                    ),
                    new Container(
                      decoration: BoxDecoration(color: rgb(255, 247, 227, 1.0)),
                      child: new Column(
                        children: <Widget>[
                          new LabelContainer(Icons.person, '我的'),
                        ],
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: new Column(
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: attachEvent(mineAsset.values.toList().getRange(0, 4)),
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: attachEvent(mineAsset.values.toList().getRange(4, 8)),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      decoration: BoxDecoration(color: rgb(255, 247, 227, 1.0)),
                      child: new Column(
                        children: <Widget>[
                          new LabelContainer(Icons.person, '发现'),
                        ],
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: new Column(
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: attachEvent(mineAsset.values.toList().getRange(8, 12)),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      // height: 40.0,
                      decoration: BoxDecoration(color: rgb(255, 247, 227, 1.0)),
                      child: new Column(
                        children: <Widget>[
                          new LabelContainer(Icons.person, '工具'),
                        ],
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: new Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              new MyIcon(mineAsset["csgo"]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                new Positioned(
                  child: new Container(
                    width: 100.0,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new Container(
                          height: 36.0,
                          width: 36.0,
                          // margin: EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            color: sybgc,
                            borderRadius: BorderRadius.all(Radius.circular(36.0)),
                            border: Border.all(width: 0.2, color: Colors.grey)
                          ),
                          child: new Icon(Icons.highlight),
                        ),
                        new Container(
                          height: 36.0,
                          width: 36.0,
                          decoration: BoxDecoration(
                            color: sybgc,
                            borderRadius: BorderRadius.all(Radius.circular(36.0)),
                            border: Border.all(width: 0.2, color: Colors.grey)
                          ),
                          child: new Icon(Icons.settings)
                        ),
                      ],
                    ),
                  ),
                  right: 20.0,
                  top: 104.0,
                ),
              ],
            ))));
  }
}

class MyIcon extends StatelessWidget {
  Map<String, String> _resouce;

  MyIcon(this._resouce);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 90.0,
      height: 70.0,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Image(
            image: new AssetImage(_resouce[imgKey]),
            width: 40.0,
            height: 40.0,
          ),
          new Text(_resouce[titleKey])
        ],
      ),
    );
  }
}

attachEvent(Iterable list){
  return list.map((m) => new Container(
    width: 90.0,
    height: 70.0,
    child: new FlatButton(
    onPressed: (){
      print(m["type"]);
    },
    child: new MyIcon(m),
  ),
  )).toList();
}
