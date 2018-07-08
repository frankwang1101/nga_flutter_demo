import 'package:flutter/material.dart';
import '../config/globalStyle.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: ybgc,
        floatingActionButton: new Container(
          width: 100.0,
          height: 30.0,
          child: new FloatingActionButton(
            backgroundColor: Colors.yellow,
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: new Text(
              '显示地理位置',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        appBar: new AppBar(
          backgroundColor: sybgc,
          title: new Text(
            "主题",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: false,
          elevation: 0.5,
          leading: new FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            new Container(
              child: new FlatButton(
                onPressed: () {},
                child: new Icon(
                  Icons.send,
                  color: Colors.grey,
                  size: 20.0,
                ),
              ),
            )
          ],
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                // height: 50.0,
                child: new TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 14.0, bottom: 14.0),
                      // helperText: "请输入标题",
                      hintText: "请输入标题",
                      border: null),
                ),
              ),
              new Expanded(
                child: new Container(
                  // height: 541.0,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: new TextField(
                    maxLines: 50,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 14.0, bottom: 14.0),
                      // contentPadding: EdgeInsets.all(4.0),
                      hintText: "请输入内容",
                      border: null,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
