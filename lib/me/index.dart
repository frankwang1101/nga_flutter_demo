import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nga_flutter/components/globalState.dart';
import '../config/globalStyle.dart';
import './assetMap.dart';
import 'package:flutter/services.dart';
import '../columns/testPress.dart';
import './settting.dart';

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
      decoration: BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(width: 1.0, color: bdcFoo()))),
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
              style: TextStyle(fontSize: 16.0, color: fontColor()),
            ),
          )
        ],
      ),
    );
  }
}

class _Personal extends State<Personal> with TickerProviderStateMixin {
  GlobalState _gl = GlobalState.instance;
  StreamSubscription _stateSub;

  @override
  void initState() {
    super.initState();
    _stateSub = _gl.onStateChanged.listen((data) {

    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            backgroundColor: ybgcFoo(),
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
                                        color: fontColor(), fontSize: 24.0),
                                  ),
                                  new Text(
                                    '24005061',
                                    style: new TextStyle(
                                        color: uidcFoo(), fontSize: 16.0),
                                  )
                                ],
                              ),
                            ),
                          ),
                          new Icon(
                            Icons.chevron_right,
                            color: Color(0xffefb973),
                          ),
                        ],
                      ),
                    ),
                    new Expanded(
                      child: new Container(
                        decoration: new BoxDecoration(color: sybgcFoo()),
                        child: new ListView(
                          padding: EdgeInsets.all(0.0),
                          children: <Widget>[
                            new Container(
                              decoration: BoxDecoration(color: sybgcFoo()),
                              child: new Column(
                                children: <Widget>[
                                  new LabelContainer(Icons.person, '我的'),
                                ],
                              ),
                            ),
                            new Container(
                              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                              decoration: new BoxDecoration(color: sybgcFoo()),
                              child: new Column(
                                children: <Widget>[
                                  new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: attachEvent(mineAsset.values
                                        .toList()
                                        .getRange(0, 4)),
                                  ),
                                  new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: attachEvent(mineAsset.values
                                        .toList()
                                        .getRange(4, 8)),
                                  ),
                                ],
                              ),
                            ),
                            new Container(
                              height: 6.0,
                              decoration: BoxDecoration(color: ybgcFoo()),
                            ),
                            new Container(
                              decoration: BoxDecoration(color: sybgcFoo()),
                              child: new Column(
                                children: <Widget>[
                                  new LabelContainer(Icons.person, '发现'),
                                ],
                              ),
                            ),
                            new Container(
                              decoration: new BoxDecoration(color: sybgcFoo()),
                              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: new Column(
                                children: <Widget>[
                                  new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: attachEvent(mineAsset.values
                                        .toList()
                                        .getRange(8, 12)),
                                  ),
                                ],
                              ),
                            ),
                            new Container(
                              height: 6.0,
                              decoration: BoxDecoration(color: ybgcFoo()),
                            ),
                            new Container(
                              // height: 40.0,
                              decoration: BoxDecoration(color: sybgcFoo()),
                              child: new Column(
                                children: <Widget>[
                                  new LabelContainer(Icons.person, '工具'),
                                ],
                              ),
                            ),
                            new Container(
                              decoration: new BoxDecoration(color: sybgcFoo()),
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
                      ),
                    )
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
                              color: sybgcFoo(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(36.0)),
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child: new FlatButton(
                            padding: EdgeInsets.all(0.0),
                            onPressed: () {
                              nightMode = !nightMode;
                              setState(() {});
                              _gl.set("night", nightMode);
                            },
                            child: new Icon(
                              Icons.highlight,
                              color: fontColor(),
                            ),
                          ),
                        ),
                        new Container(
                            height: 36.0,
                            width: 36.0,
                            decoration: BoxDecoration(
                                color: sybgcFoo(),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(36.0)),
                                border:
                                    Border.all(width: 0.2, color: Colors.grey)),
                            child: new FlatButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: () {
                                var r = new MaterialPageRoute(builder: (ctx) {
                                  return new Setting();
                                });
                                Navigator.push(context, r);
                              },
                              child: new Icon(
                                Icons.settings,
                                color: fontColor(),
                              ),
                            )),
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
          new Text(
            _resouce[titleKey],
            style: TextStyle(color: fontColor()),
          )
        ],
      ),
    );
  }
}

attachEvent(Iterable list) {
  return list
      .map((m) => new Container(
            width: 90.0,
            height: 70.0,
            child: new FlatButton(
              onPressed: () {
                print(m["type"]);
              },
              child: new MyIcon(m),
            ),
          ))
      .toList();
}
