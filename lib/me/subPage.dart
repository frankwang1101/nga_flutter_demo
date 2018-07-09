import 'package:flutter/material.dart';
import '../config/globalStyle.dart';

class CommonAppLayout extends StatelessWidget {
  String _title;
  Widget _child;

  CommonAppLayout({String title, Widget child})
      : _title = title,
        _child = child;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: ybgc,
        appBar: new AppBar(
          title: new Text(_title),
          leading: new FlatButton(
            onPressed: back(context),
            child: new Icon(Icons.chevron_left),
          ),
        ),
        body: _child,
      ),
    );
  }
}

// 账号设置
class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CommonAppLayout(title: '账号设置', child: new Container());
  }
}

// 图片质量
class PicQuality extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CommonAppLayout(title: '图片质量', child: new Container());
  }
}
