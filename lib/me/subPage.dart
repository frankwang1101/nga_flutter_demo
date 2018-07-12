import 'package:flutter/material.dart';
import '../config/globalStyle.dart';
import '../config/mock.dart';

class CommonAppLayout extends StatelessWidget {
  final String _title;
  final Widget _child;

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
            onPressed: () => back(context),
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
  @override
  State<Account> createState() {
    return new _Account();
  }
}

// 账号设置
class _Account extends State<Account> {
  List<Map<String, Object>> accountList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    accountList = accounts.map((Map<String, Object> item) {
      if (item["uid"] == 10000) {
        item["active"] = true;
      }
      return item;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
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
          onPressed: (){
            // if (item["active"] != true) {
              this.setState((){
                accountList.forEach((it){
                  it["active"] = it["uid"] == item["uid"];
                });
              });
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
  @override
  State<PicQuality> createState() {
    // TODO: implement createState
    return new _PicQuality();
  }
}

// 图片质量
class _PicQuality extends State<PicQuality> {
  int wifiSelect;
  int mobileSelect;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wifiSelect = 2;
    mobileSelect = 4;
  }

  @override
  Widget build(BuildContext context) {
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
              new OptionWidget('高', '高质量图片，体验更好', 1, wifiSelect, (val) {
                setState(() {
                  wifiSelect = val;
                });
              }),
              new OptionWidget('中', '节省流量，加载速度快', 2, wifiSelect, (val) {
                setState(() {
                  wifiSelect = val;
                });
              }),
              new OptionWidget('低', '不显示图片', 3, wifiSelect, (val) {
                setState(() {
                  wifiSelect = val;
                });
              }),
              new Text(
                '2G/3G/4G网络下的图片质量',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 13.0),
              ),
              new OptionWidget('高', '高质量图片，体验更好', 4, mobileSelect, (val) {
                setState(() {
                  mobileSelect = val;
                });
              }),
              new OptionWidget('中', '节省流量，加载速度快', 5, mobileSelect, (val) {
                setState(() {
                  mobileSelect = val;
                });
              }),
              new OptionWidget('低', '不显示图片', 6, mobileSelect, (val) {
                setState(() {
                  mobileSelect = val;
                });
              }),
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

// 应用首页
class AppHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CommonAppLayout(title: '应用首页', child: new Container());
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
