import 'package:flutter/material.dart';
import '../config/baseType.dart';
import '../config/globalStyle.dart';
import '../config/mock.dart';
import '../components/postItem.dart';
import './addPage.dart';
import './postDetail.dart';

class ColumnPage extends StatefulWidget {
  @override
  State<ColumnPage> createState() {
    // TODO: implement createState
    return new _Column();
  }
}

class _Column extends State<ColumnPage> with TickerProviderStateMixin {
  List<PostRecord> _records;
  int _currentPage;
  int _pageSize;

  @override
  void initState() {
    super.initState();
    _currentPage = 1;
    _pageSize = 30;
    if (_records == null) {
      _records = [];
    }
    this.getData();
  }

  getData() {
    int start = (this._currentPage - 1) * this._pageSize;
    int end = this._currentPage * this._pageSize;
    if (start > 0) {
      end = 43;
    }
    this
        ._records
        .addAll(records.getRange(start, end).map((Map<String, Object> r) {
          return new PostRecord(
              r["uid"],
              r["title"],
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
              DateTime.parse(r["createTime"]),
              int.parse(r["posts"]));
        }).toList());
  }

  @override
  Widget build(BuildContext context) {
    final bottomTextSty = new TextStyle(color: Colors.grey, fontSize: 12.0);
    final titleTextSty = new TextStyle(color: Colors.black87, fontSize: 18.0);
    return new MaterialApp(
      home: new Scaffold(
        drawer: new Directionality(
          textDirection: TextDirection.rtl,
          child: new Drawer(
            child: new Container(
              child: new Column(
                children: <Widget>[
                  new Container(
                    child: new Row(
                      children: <Widget>[
                        new Icon(Icons.search),
                        new Text('提醒')
                      ],
                    ),
                  ),
                  new Container(
                    child: new Row(
                      children: <Widget>[
                        new Icon(Icons.search),
                        new Text('提醒')
                      ],
                    ),
                  ),
                  new Container(
                    child: new Row(
                      children: <Widget>[
                        new Icon(Icons.search),
                        new Text('提醒')
                      ],
                    ),
                  ),
                  new Container(
                    child: new Row(
                      children: <Widget>[
                        new Icon(Icons.search),
                        new Text('提醒')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(right: 10.0),
              child: new FloatingActionButton(
                heroTag: "plus",
                foregroundColor: activeColor,
                shape: CircleBorder(),
                backgroundColor: Colors.black54,
                mini: true,
                onPressed: () {
                  this._currentPage = 1;
                  this.getData();
                },
                child: new Icon(Icons.redo),
              ),
            ),
            new FloatingActionButton(
              heroTag: "edit",
              foregroundColor: activeColor,
              shape: CircleBorder(),
              backgroundColor: Colors.black54,
              mini: true,
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (ctx) {
                  return new AddPage();
                }));
              },
              child: new Icon(Icons.edit),
            )
          ],
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
            '网事杂谈',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: false,
          actions: <Widget>[
            new Center(
              child: new Container(
                margin: EdgeInsets.only(right: 5.0),
                // width: 50.0,
                // height: 24.0,
                child: new Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
              ),
            ),
            new Center(
              child: new Container(
                height: 24.0,
                margin: EdgeInsets.only(right: 20.0),
                child: new Icon(
                  Icons.list,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        body: new Container(
          margin: EdgeInsets.all(0.0),
          padding: EdgeInsets.all(0.0),
          height: 591.0,
          child: new ListView(
            // shrinkWrap: true,
            padding: const EdgeInsets.all(0.0),
            children: _records.map((PostRecord post) {
              return new FlatButton(
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return Post();
                  }));
                },
                child: new Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                    top: BorderSide(color: Colors.grey, width: 1.0),
                    bottom: BorderSide(color: Colors.grey, width: 1.0),
                  )),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        post.title,
                        style: titleTextSty,
                        textAlign: TextAlign.left,
                      ),
                      new Container(
                        height: 9.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              new Text(
                                post.user.username,
                                style: bottomTextSty,
                              ),
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new Container(
                                child: new Text(
                                  post.updateTime.toString(),
                                  style: bottomTextSty,
                                ),
                                margin: EdgeInsets.only(right: 6.0),
                              ),
                              new Text(
                                post.replyNum.toString(),
                                style: bottomTextSty,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
