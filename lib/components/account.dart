import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nga_flutter/config/globalStyle.dart';
import 'package:nga_flutter/config/mock.dart';
import 'globalState.dart';

class Account extends StatefulWidget {
  @override
  State<Account> createState() {
    return new _Account();
  }
}

class _Account extends State<Account> {
  List<Map<String, Object>> accountList;
  GlobalState _gl = GlobalState.instance;
  StreamSubscription _stateSub;

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
    _stateSub = _gl.onStateChanged.listen((data) {
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_gl);
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
          onPressed: () {
            // if (item["active"] != true) {
            this.setState(() {
              accountList.forEach((it) {
                it["active"] = it["uid"] == item["uid"];
              });
            });
            _gl.set("user", item);
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
    return new MaterialApp(
      home: new Scaffold(
          backgroundColor: ybgc,
          appBar: new AppBar(
            backgroundColor: sybgc,
            title: new Text(
              '账号管理',
              style: TextStyle(color: Colors.black),
            ),
            leading: new FlatButton(
              onPressed: () => back(context),
              child: new Icon(Icons.chevron_left),
            ),
          ),
          body: new Container(
            child: new Column(
              children: accountWidgets,
            ),
          )),
    );
  }
}
