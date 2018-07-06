import 'package:flutter/material.dart';
import '../config/baseType.dart';
import '../config/globalStyle.dart';
import '../components/postItem.dart';
import './postDetail.dart';

class ColumnPage extends StatefulWidget {
  @override
  State<ColumnPage> createState() {
    // TODO: implement createState
    return new _Column();
  }
}

class _Column extends State<ColumnPage> with TickerProviderStateMixin {

  List<PostColumn> _records;
  int _currentPage;

  @override
    void initState() {
      super.initState();
      _currentPage = 1;
      _records = <PostColumn>[

      ];
    }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8.0),
        children: _records.map((PostColumn post){
          return new FlatButton(
            onPressed: (){
              Navigator.push(context, new MaterialPageRoute(
                builder: (context){
                  return new Post();
                }
              ));
            },
            child: post,
          );
        }).toList(),
      ),
    );
  }
}
