import 'package:flutter/material.dart';
import '../config/globalStyle.dart';

class Personal extends StatefulWidget {
  @override
  State<Personal> createState() {
    return new _Personal();
  }
}


class LabelContainer extends StatelessWidget {
  IconData icon;
  String title;
  LabelContainer(this.icon, this.title);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 43.3,
      padding: EdgeInsets.only(left: 18.0),
      child: new Row(
        children: <Widget>[
          new Icon(icon, color: rgb(18, 183, 245),),
          new Container(
            margin: EdgeInsets.only(left: 4.0),
            child: new Text(
              title,
              style: TextStyle(
                  fontSize: 16.0, color: rgb(50, 50, 50, 1.0)),
            ),
          )
        ],
      ),
    );
  }
}

class _Personal extends State<Personal> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            backgroundColor: ybgc,
            body: new Center(
                child: new Stack(
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Container(
                      height: 20.0,
                    ),
                    new Container(
                      height: 102.0,
                      decoration: boxGrey,
                      padding: EdgeInsets.all(16.0),
                      // width: 400.0,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Container(
                            height: 70.4,
                            width: 70.4,
                            decoration: boxGrey,
                            child: new Image.asset('lib/assets/football.png'),
                          ),
                          new Expanded(
                            child: new Container(
                              decoration: boxGrey,
                              margin: EdgeInsets.only(left: 10.0),
                              padding: EdgeInsets.only(top: 9.0, bottom: 9.0),
                              child: new Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                    'username',
                                    style: new TextStyle(
                                        color: Colors.black, fontSize: 24.0),
                                  ),
                                  new Text(
                                    '24005061',
                                    style: new TextStyle(
                                        color:
                                            rgb(183, 180, 173, 1.0),
                                        fontSize: 16.0),
                                  )
                                ],
                              ),
                            ),
                          ),
                          new Icon(Icons.arrow_right),
                        ],
                      ),
                    ),
                    new Container(
                      decoration: BoxDecoration(color: rgb(255, 247, 227, 1.0)),
                      child: new Column(
                        children: <Widget>[
                          new LabelContainer(Icons.person, '我的'),
                        ],
                      ),
                    ),
                    new Text('mine label'),
                    new Text('personal action btn'),
                    new Text('find label'),
                    new Text('personal explore info'),
                    new Text('tool label'),
                    new Text('personal tool btn'),
                  ],
                ),
                new Positioned(
                  child: new Container(
                    decoration: boxGrey,
                    width: 80.0,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new Icon(Icons.highlight),
                        new Icon(Icons.settings)
                      ],
                    ),
                  ),
                  right: 20.0,
                  top: 110.0,
                ),
              ],
            ))));
  }
}
