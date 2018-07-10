import 'package:flutter/material.dart';
import '../config/globalStyle.dart';
import './subPage.dart';

class Setting extends StatefulWidget {
  @override
  State<Setting> createState() {
    // TODO: implement createState
    return new _Setting();
  }
}

class _Setting extends State<Setting> with TickerProviderStateMixin {
  int _cache;
  int _history;
  int _craft;
  bool _showAvatar;
  bool _msgNotify;
  bool _showSign;

  @override
  void initState() {
    super.initState();
    this._cache = 1234;
    this._history = 1111;
    this._craft = 3333;
    this._showAvatar = false;
    this._msgNotify = false;
    this._showSign = false;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          brightness: Brightness.light,
          backgroundColor: sybgc,
          title: new Text(
            "设置",
            style: new TextStyle(color: Colors.black),
          ),
          leading: new FlatButton(
            onPressed: () => back(context),
            child: new Center(
              child: new Icon(Icons.chevron_left),
            ),
          ),
        ),
        backgroundColor: ybgc,
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Expanded(
                child: new ListView(
                  children: <Widget>[
                    new RightIcon(
                      title: "账号管理",
                      action: () {
                        Navigator.push(context,
                            new MaterialPageRoute(builder: (ctx) {
                          return new Account();
                        }));
                      },
                    ),
                    new RightIcon(
                      title: "图片质量",
                      action: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (ctx) {
                            return new PicQuality();
                          }),
                        );
                      },
                    ),
                    new RightIcon(
                      title: "应用首页",
                      action: () {
                        Navigator.push(context,
                            new MaterialPageRoute(builder: (ctx) {
                          return new AppHomepage();
                        }));
                      },
                    ),
                    new SwitchBlock('2G/3G/4G显示用户头像', _showAvatar, (res) {
                      this.setState(() {
                        this._showAvatar = res;
                      });
                    }),
                    new SwitchBlock('系统消息提醒', _msgNotify, (res) {
                      this.setState(() {
                        this._msgNotify = res;
                      });
                    }),
                    new SwitchBlock('显示帖子签名', _showSign, (res) {
                      this.setState(() {
                        this._showSign = res;
                      });
                    }),
                    new Container(
                      height: 7.0,
                      decoration: BoxDecoration(color: dybgc),
                    ),
                    new InfoBlock('清除缓存', _cache.toString(), () {
                      confirmBottom(context, () {
                        this.setState(() {
                          _cache = 0;
                        });
                        Navigator.pop(context);
                      });
                    }),
                    new InfoBlock('清除浏览历史', _history.toString(), () {
                      confirmBottom(context, () {
                        this.setState(() {
                          _history = 0;
                        });
                        Navigator.pop(context);
                      });
                    }),
                    new InfoBlock('清除草稿', _craft.toString(), () {
                      confirmBottom(context, () {
                        this.setState(() {
                          _craft = 0;
                        });
                        Navigator.pop(context);
                      });
                    }),
                    new Container(
                      height: 7.0,
                      decoration: BoxDecoration(color: dybgc),
                    ),
                    new RightIcon(
                      title: '给我评分',
                      action: () {},
                    ),
                    new RightIcon(
                      title: '关于我们',
                      action: () {
                        Navigator.push(context,
                            new MaterialPageRoute(builder: (ctx) {
                          return new AboutMe();
                        }));
                      },
                    ),
                    new RightIcon(
                      title: '网络诊断',
                      action: () {
                        Navigator.push(context,
                            new MaterialPageRoute(builder: (ctx) {
                          return new NetworkDetect();
                        }));
                      },
                    ),
                    new Container(
                      // width: 200.0,
                      margin: EdgeInsets.only(top: 20.0),
                      child: new Center(
                        child: new RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          onPressed: (){},
                          child: new Container(
                            width: 120.0,
                            height: 20.0,
                            child: new Text('退出当前账号', textAlign: TextAlign.center, style: TextStyle( fontSize: 16.0),),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RightIcon extends StatelessWidget {
  final String _title;
  final Function _action;

  RightIcon({String title, Function action})
      : _title = title,
        _action = action;

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(color: new Color(0xffcccccc), width: 0.5))),
      child: new FlatButton(
        onPressed: _action,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text(_title),
            new Icon(
              Icons.chevron_right,
              color: activeColor,
            )
          ],
        ),
      ),
    );
  }
}

class SwitchBlock extends StatelessWidget {
  final String _title;
  final bool value;
  final Function _cb;

  SwitchBlock(this._title, this.value, this._cb);

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(color: new Color(0xffcccccc), width: 0.5))),
      padding: EdgeInsets.only(left: 14.0, right: 14.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Text(_title),
          new Switch(
            onChanged: (active) {
              _cb(active);
            },
            value: value,
            activeColor: activeColor,
          )
        ],
      ),
    );
  }
}

class InfoBlock extends StatelessWidget {
  final String _title;
  final String _info;
  final Function action;

  InfoBlock(this._title, this._info, this.action);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: EdgeInsets.only(left: 14.0, right: 24.0),
      decoration: BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(color: new Color(0xffcccccc), width: 0.5))),
      child: new FlatButton(
        onPressed: action,
        padding: EdgeInsets.all(0.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text(_title),
            new Text(_info),
          ],
        ),
      ),
    );
  }
}

confirmBottom(context, Function action) {
  showModalBottomSheet(
    context: context,
    builder: (ctx) => new Container(
          height: 76.0,
          decoration: BoxDecoration(color: Colors.transparent),
          child: new Column(
            children: <Widget>[
              new Container(
                  width: 360.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: new Center(
                      child: new FlatButton(
                    onPressed: action,
                    child: new Text(
                      '确认清除',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ))),
              new Container(
                  width: 360.0,
                  height: 30.0,
                  margin: EdgeInsets.only(top: 8.0),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: new Center(
                      child: new FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: new Text(
                      '取消',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17.0, color: activeColor),
                    ),
                  ))),
            ],
          ),
        ),
  );
}
