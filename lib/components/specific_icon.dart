import 'package:flutter/material.dart';

class SpecificIcon extends StatelessWidget {

  String title;

  SpecificIcon(this.title);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Column(
        children: <Widget>[
          new Icon(Icons.verified_user),
          new Text(title)
        ],
      ),
    );
  }
}