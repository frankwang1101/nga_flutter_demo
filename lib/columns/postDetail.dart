import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nga_flutter/components/globalState.dart';
import '../config/globalStyle.dart';
import '../config/mock.dart';
import '../config/baseType.dart';

class Post extends StatefulWidget {
  @override
  State<Post> createState() {
    return new _Post();
  }
}

class _Post extends State<Post> with TickerProviderStateMixin {
  PostType _details;
  List<PostType> _replies;
  String tag;
  int _currentPage;
  int _total;
  int _pageSize;
  GlobalState _gl = GlobalState.instance;
  StreamSubscription _stateSub;

  @override
  void initState() {
    super.initState();
    _currentPage = 1;
    _total = 20;
    _pageSize = 20;
    _details = new PostType(
      int.parse(detail["uid"]),
      detail["title"],
      DateTime.parse(detail["createTime"]),
      DateTime.parse(detail["updateTime"]),
      detail["content"],
      detail["tag"],
      new User(
        int.parse(user["uid"]),
        user["userName"],
        user["level"],
        user["levelExp"],
        user["reputation"],
        user["posts"],
        Gender.values[user["gender"]],
        DateTime.parse(user["createTime"]),
      ),
      detail["up"],
      detail["down"],
    );
    _details.floor = '楼主';
    _replies = <PostType>[];
    int times = 20;
    if (_currentPage == 1) {
      times = 19;
      _replies.add(_details);
    }
    for (int i = 0; i < times; i++) {
      _replies.add(new PostType(
          int.parse(detail["uid"]),
          detail["title"],
          DateTime.parse(detail["createTime"]),
          DateTime.parse(detail["updateTime"]),
          detail["content"],
          detail["tag"],
          new User(
            int.parse(user["uid"]),
            user["userName"],
            user["level"],
            user["levelExp"],
            user["reputation"],
            user["posts"],
            Gender.values[user["gender"]],
            DateTime.parse(user["createTime"]),
          ),
          detail["up"],
          detail["down"],
          "${i+1 + (_currentPage - 1) * _pageSize}楼"));
    }

    tag = _details.tag != null ? '[${_details.tag}]' : '';
  }

  @override
  Widget build(BuildContext context) {
    print(_gl);
    final key = new GlobalKey<ScaffoldState>();
    return MaterialApp(
      home: new Scaffold(
        key: key,
        endDrawer: new Drawer(
          child: new Container(
            child: new Column(
              children: <Widget>[
                new Container(
                  child: new Row(
                    children: <Widget>[new Icon(Icons.search), new Text('提醒')],
                  ),
                ),
                new Container(
                  child: new Row(
                    children: <Widget>[new Icon(Icons.search), new Text('提醒')],
                  ),
                ),
                new Container(
                  child: new Row(
                    children: <Widget>[new Icon(Icons.search), new Text('提醒')],
                  ),
                ),
                new Container(
                  child: new Row(
                    children: <Widget>[new Icon(Icons.search), new Text('提醒')],
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: ybgc,
        appBar: new AppBar(
          leading: new FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Container(
              child: new Center(
                child: new Icon(Icons.chevron_left),
              ),
            ),
          ),
          brightness: Brightness.light,
          backgroundColor: sybgc,
          title: new Text(
            '主题详情',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: false,
          actions: <Widget>[
            new Center(
              child: new Container(
                margin: EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    border: bGrey),
                width: 50.0,
                height: 24.0,
                child: new Center(
                  child: new Text(
                    _details.floor,
                    textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            new Center(
              child: new Container(
                height: 24.0,
                width: 24.0,
                margin: EdgeInsets.only(right: 20.0),
                child: new FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: (){
                    key.currentState.openEndDrawer();
                  },
                  child: new Icon(
                  Icons.list,
                  color: Colors.black,
                ),
                ),
              ),
            )
          ],
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    border: BorderDirectional(
                        bottom: BorderSide(width: 1.0, color: Colors.grey))),
                child: new Text(
                  '$tag${_details.title}',
                  style: new TextStyle(
                      fontSize: 24.0, fontWeight: FontWeight.w500),
                ),
              ),
              new Expanded(
                // height: 510.0,
                child: new ListView(
                  children: _replies.map((PostType type) {
                    return new Container(
                        child: new Column(
                      children: <Widget>[
                        new Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              border: BorderDirectional(
                                  bottom: BorderSide(
                                      width: 1.0, color: Colors.grey))),
                          child: new Row(
                            children: <Widget>[
                              new Container(
                                margin: EdgeInsets.only(right: 4.0),
                                child: new CircleAvatar(
                                  radius: 22.0,
                                ),
                              ),
                              new Expanded(
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new Text(
                                          type.user.username,
                                          style: new TextStyle(
                                              color: activeColor,
                                              fontSize: 16.0),
                                        ),
                                        new Text(
                                          type.floor,
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    new Container(
                                      width: 160.0,
                                      // decoration: BoxDecoration(color: Colors.black38),
                                      // alignment: Alignment(0.0, 0.0),
                                      child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          new Text(
                                            '级别:${type.user.level}',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          new Text(
                                            '威望:${type.user.reputation}',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          new Text(
                                            '发帖:${type.user.posts}',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        new Container(
                            padding: EdgeInsets.all(12.0),
                            child: new RichText(
                              text: TextSpan(
                                  text: type.content,
                                  style: new TextStyle(color: Colors.black87)),
                            )),
                        new Container(
                          decoration: BoxDecoration(
                              border: BorderDirectional(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 1.0))),
                          height: 30.0,
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              new Center(
                                child: new Text(
                                  type.createTime.toString(),
                                  textAlign: TextAlign.right,
                                ),
                              )
                            ],
                          ),
                        ),
                        new Container(
                          decoration: BoxDecoration(
                              border: BorderDirectional(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 1.0))),
                          child: new Row(
                            children: <Widget>[
                              new Icon(Icons.keyboard_arrow_up),
                              new Text(type.up.toString()),
                              new Icon(Icons.keyboard_arrow_down),
                              new Text(type.down.toString()),
                            ],
                          ),
                        ),
                      ],
                    ));
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
