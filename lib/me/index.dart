import 'package:flutter/material.dart';

class Personal extends StatefulWidget {
  @override
  State<Personal> createState() {
    return new _Personal();
  }
}

class _Personal extends State<Personal> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            body: new Center(
                child: new Column(
      children: <Widget>[
        new Stack(
          alignment: new Alignment(0.8, 1.0),
          children: <Widget>[
            new Container(
              child: new Row(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new CircleAvatar(
                        backgroundImage: new AssetImage('../assets/football.png'),
                      ),
                      new Column(
                        children: <Widget>[
                          new Text('username'),
                          new Text('uid')
                        ],
                      )
                    ],
                  ),
                  new Icon(Icons.arrow_right)
                ],
              ),
            ),
            new Row(
              children: <Widget>[
                new Icon(Icons.highlight),
                new Icon(Icons.settings)
              ],
            )
          ],
        ),
        new Row(
          children: <Widget>[
            new Icon(Icons.person),
            new Text('我的')
          ],
        ),
        new Text('mine label'),
        new Text('personal action btn'),
        new Text('find label'),
        new Text('personal explore info'),
        new Text('tool label'),
        new Text('personal tool btn'),
      ],
    ))));
  }
}
