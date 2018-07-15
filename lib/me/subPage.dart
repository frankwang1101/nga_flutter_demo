import 'dart:async';

import 'package:flutter/material.dart';
import '../config/globalStyle.dart';
import '../config/mock.dart';
import '../components/globalState.dart';

class CommonAppLayout extends StatelessWidget {
  final String _title;
  final Widget _child;
  GlobalState _gl = GlobalState.instance;
  StreamSubscription _stateSub;

  CommonAppLayout({String title, Widget child})
      : _title = title,
        _child = child;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: ybgc,
        appBar: new AppBar(
          backgroundColor: sybgc,
          title: new Text(
            _title,
            style: TextStyle(color: Colors.black),
          ),
          leading: new FlatButton(
            onPressed: () => back(context, _gl.getAll()),
            child: new Icon(Icons.chevron_left),
          ),
        ),
        body: _child,
      ),
    );
  }
}

class CommonStateAppLayout extends StatefulWidget {
  @override
  State<CommonStateAppLayout> createState() {
    // TODO: implement createState
    return new _CommonStateAppLayout();
  }
}

class _CommonStateAppLayout extends State<CommonStateAppLayout> {
  final String _title;
  final Widget _child;

  _CommonStateAppLayout({String title, Widget child})
      : _title = title,
        _child = child;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: ybgc,
        appBar: new AppBar(
          backgroundColor: sybgc,
          title: new Text(
            _title,
            style: TextStyle(color: Colors.black),
          ),
          leading: new FlatButton(
            onPressed: () => back(context),
            child: new Icon(Icons.chevron_left),
          ),
        ),
        body: _child,
      ),
    );
  }
}

class Account extends StatefulWidget {

  int _uid;

  Account(this._uid);

  @override
  State<Account> createState() {
    return new _Account(this._uid);
  }
}

// 账号设置
class _Account extends State<Account> {
  List<Map<String, Object>> accountList;
  GlobalState _gl = GlobalState.instance;
  StreamSubscription _stateSub;
  int _uid;

  _Account(this._uid);

  @override
  void initState() {
    super.initState();
    Map target;
    accountList = accounts.map((Map<String, Object> item) {
      if (item["uid"] == this._uid) {
        item["active"] = true;
        target = item;
      }
      return item;
    }).toList();
    _stateSub = _gl.onStateChanged.listen((data) {});
    this._gl.set("user", target);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _stateSub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    print(_gl);
    List<Widget> accountWidgets = accountList.map((Map<String, Object> item) {
      Widget check =
          item["active"] == true ? new Icon(Icons.check_box) : new Text('');
      return new Container(
        // padding: EdgeInsets.only(right: 15.0),
        height: 70.0,
        decoration: BoxDecoration(
            border: BorderDirectional(
                bottom: BorderSide(color: Colors.grey, width: 0.5))),
        child: new FlatButton(
          onPressed: () {
            // if (item["active"] != true) {
            this.setState(() {
              accountList.forEach((it) {
                it["active"] = it["uid"] == item["uid"];
              });
            });
            _gl.set("user", item);
            // }
          },
          child: new Row(
            children: <Widget>[
              new Container(
                margin: EdgeInsets.only(top: 15.0, bottom: 15.0, right: 15.0),
                child: new CircleAvatar(
                  backgroundImage: AssetImage('lib/assets/football.png'),
                ),
              ),
              new Expanded(
                child: new Container(
                  child: new Text(item["username"]),
                ),
              ),
              check
            ],
          ),
        ),
      );
    }).toList();
    accountWidgets.add(new Container(
      decoration: BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(color: Colors.grey, width: 0.5))),
      padding: EdgeInsets.all(15.0),
      child: new Row(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(right: 15.0),
            child: new Icon(Icons.exposure_plus_1),
          ),
          new Text("添加账号"),
        ],
      ),
    ));
    return new CommonAppLayout(
        title: '账号管理',
        child: new Container(
          child: new Column(
            children: accountWidgets,
          ),
        ));
  }
}

class PicQuality extends StatefulWidget {

  List<int> _qualitys;

  PicQuality(this._qualitys);

  @override
  State<PicQuality> createState() {
    // TODO: implement createState
    return new _PicQuality(_qualitys);
  }
}

// 图片质量
class _PicQuality extends State<PicQuality> {
  List<int> _qualitys;

  _PicQuality(this._qualitys);

  int wifiSelect;
  int mobileSelect;
  GlobalState _gl = GlobalState.instance;
  StreamSubscription _stateSub;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wifiSelect = _gl.get("wifiPic") != null ? _gl.get("wifiPic") : _qualitys[0];
    mobileSelect = _gl.get("mobilePic") != null ? _gl.get("mobilePic") : _qualitys[1];
    _stateSub = _gl.onStateChanged.listen((data) {
      setState(() {
        wifiSelect = data["wifiPic"] != null ? data["wifiPic"] : _qualitys[0];
        mobileSelect = data["mobilePic"] != null ? data["mobilePic"] : _qualitys[1];
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _stateSub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    setQuality(key, data) {
      return (val) {
        _gl.set(key, data);
      };
    }

    return new CommonAppLayout(
        title: '图片质量',
        child: new Container(
          padding: EdgeInsets.all(10.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                'Wi-Fi网络下的图片质量',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 13.0),
              ),
              new OptionWidget(
                  '高', '高质量图片，体验更好', 1, wifiSelect, setQuality('wifiPic', 1)),
              new OptionWidget(
                  '中', '节省流量，加载速度快', 2, wifiSelect, setQuality('wifiPic', 2)),
              new OptionWidget(
                  '低', '不显示图片', 3, wifiSelect, setQuality('wifiPic', 3)),
              new Text(
                '2G/3G/4G网络下的图片质量',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 13.0),
              ),
              new OptionWidget('高', '高质量图片，体验更好', 4, mobileSelect,
                  setQuality('mobilePic', 4)),
              new OptionWidget('中', '节省流量，加载速度快', 5, mobileSelect,
                  setQuality("mobilePic", 5)),
              new OptionWidget(
                  '低', '不显示图片', 6, mobileSelect, setQuality("mobilePic", 6)),
            ],
          ),
        ));
  }
}

class OptionWidget extends StatelessWidget {
  final String label1;
  final String label2;
  final int type;
  final int selected;
  final Function cb;

  OptionWidget(this.label1, this.label2, this.type, this.selected, this.cb);

  @override
  Widget build(BuildContext context) {
    Widget activeIcon =
        this.type == this.selected ? new Icon(Icons.check) : new Container();
    return new Container(
      decoration: BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(color: Color(0xffcccccc), width: 0.5))),
      child: new FlatButton(
        padding: EdgeInsets.all(0.0),
        onPressed: () => cb(type),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text(label1),
            new Row(
              children: <Widget>[
                new Text(
                  label2,
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
                activeIcon
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AppHomepage extends StatefulWidget {
  String type;

  AppHomepage(this.type);

  @override
  State<AppHomepage> createState() {
    // TODO: implement createState
    return new _AppHomepage(type);
  }
}

// 应用首页
class _AppHomepage extends State<AppHomepage> {
  GlobalState _gl = GlobalState.instance;
  StreamSubscription _statePub;
  String _current;

  _AppHomepage(this._current);

  @override
  void initState() {
    super.initState();
    _statePub = _gl.onStateChanged.listen((data) {
      setState(() {
        _current = data["homepage"];
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _statePub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = homepageMap.keys.map((String key) {
      Widget icon = key == this._current
          ? new Icon(Icons.check_circle_outline)
          : new Container();
      return new Container(
        height: 40.0,
        child: new FlatButton(
          onPressed: () {
            this._gl.set("homepage", key);
          },
          padding: EdgeInsets.all(0.0),
          child: new Row(children: <Widget>[new Text(homepageMap[key]), icon]),
        ),
      );
    }).toList();

    return new CommonAppLayout(
        title: '图片质量',
        child: new Container(
          padding: EdgeInsets.all(10.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rows,
          ),
        ));
  }
}

// 给我评分
class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CommonAppLayout(title: '关于我们', child: new Container());
  }
}

// 网络诊断
class NetworkDetect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CommonAppLayout(title: '网络诊断', child: new Container());
  }
}
