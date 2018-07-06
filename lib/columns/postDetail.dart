import 'package:flutter/material.dart';
import '../config/globalStyle.dart';
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

  @override
  void initState() {
    super.initState();
    _details = new PostType();
    _replies = [
      new PostType(),
      new PostType(),
      new PostType(),
      new PostType(),
      new PostType(),
    ];
    _currentPage = 1;
    _total = 5;
    _pageSize = 20;
    tag = _details.tag.isNotEmpty ? '[${_details.tag}]' : '';
    if (_currentPage == 1) {
      _replies.insert(0, _details);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                child: new Text('$tag${_details.title}'),
              ),
              new Container(
                child: new ListView(
                  children: _replies.map((PostType type) {
                    return new Container(
                        child: new Column(
                      children: <Widget>[
                        new Container(
                          child: new Row(
                            children: <Widget>[
                              new CircleAvatar(),
                              new Expanded(
                                child: new Column(
                                  children: <Widget>[
                                    new Row(
                                    children: <Widget>[
                                      new Text(type.user.username),
                                      new Text('楼'),
                                    ],
                                  ),
                                  new Row(
                                    children: <Widget>[
                                      new Text('级别:${type.user.level}'),
                                      new Text('威望:${type.user.reputaion}'),
                                      new Text('发帖:${type.user.posts}'),
                                    ],
                                  ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        new Container(
                          child: new Text(type.content)
                        ),
                        new Container(
                          child: new Text(
                            type.createTime.toString()
                          ),
                        ),
                        new Container(
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
