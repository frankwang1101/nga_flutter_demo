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
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          backgroundColor: sybgc,
          title: new Text("设置"),
          leading: new FlatButton(
            onPressed: back(context),
            child: new Center(
              child: new Icon(Icons.chevron_left),
            ),
          ),
        ),
        backgroundColor: ybgc,
        body: new Container(
          child: new Expanded(
            child: new ListView(
              children: <Widget>[
                new RightIcon(title: "账号管理", route: new MaterialPageRoute(
                  builder: (ctx){
                    return new Account();
                  }
                ),),
                new RightIcon(title: "图片质量", route: new MaterialPageRoute(
                  builder: (ctx){
                    return new PicQuality();
                  }
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class RightIcon extends StatelessWidget {

  final String _title;
  final Route _route;

  RightIcon({
    String title,
    Route route
  }):
    _title = title,
    _route = route;

  @override
    Widget build(BuildContext context) {
      return new FlatButton(
        onPressed: (){
          Navigator.push(context, _route);
        },
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text(_title),
            new Icon(Icons.chevron_right, color: activeColor,)
          ],
        ),
      );
    }
}