import 'package:flutter/material.dart';

class Info{
  String title;
  int id;
  int uid;
  String username;
  DateTime updateTime;
  int replyNum;
  String tag;

  Info(this.id, this.title, this.tag, this.uid, this.username, this.updateTime, this.replyNum);

}


class PostColumn extends StatelessWidget {
  Info _info;

  PostColumn({Info info}) : _info = info;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Container(
      child: new Column(
        children: <Widget>[
          new Text(_info.title),
          new Row(
            children: <Widget>[
              new Container(
                child: new Text('${_info.username}[${_info.tag}]'),
              ),
              new Container(
                child: new Row(
                  children: <Widget>[
                    new Text(_info.updateTime.toString()),
                    new Text(_info.replyNum.toString()),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
