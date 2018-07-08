import 'package:flutter/material.dart';
import '../config/baseType.dart';


class PostColumn extends StatelessWidget {
  PostRecord _info;

  PostColumn({PostRecord info}) : _info = info;

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
                child: new Text('${_info.username}'),
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
