import 'package:flutter/material.dart';

class Column extends StatefulWidget {
  @override
  State<Column> createState() {
    // TODO: implement createState
    return null;
  }
}

class _Column extends State<Column> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          const Text('I\'m dedicating every day to you'),
          const Text('Domestic life was never quite my style'),
          const Text('When you smile, you knock me out, I fall apart'),
          const Text('And I thought I was so smart'),
        ],
      ),
    );
  }
}
