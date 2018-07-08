import 'package:flutter/material.dart';
import '../config/globalStyle.dart';
import '../config/baseType.dart';
import '../config/mock.dart';
import '../columns/postDetail.dart';

class RecColumn extends StatelessWidget {
  final RecommandItem _col;

  RecColumn(this._col);

  @override
  Widget build(BuildContext context) {
    return new Container(
      // height: 223.13,
      // constraints: BoxConstraints.expand(),
      // decoration: new BoxDecoration(border: Border.all(color: Colors.grey)),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Container(
            height: 143.13,
            // decoration: BoxDecoration(color: Colors.pink),
            child: new Image(
              image: new NetworkImage(_col.imgSrc),
              height: 143.13,
              // fit: BoxFit.cover,
            ),
          ),
          new Container(
            padding: EdgeInsets.all(10.0),
            child: new Center(child: new Text(_col.title, style: new TextStyle(color: Colors.black, fontSize: 16.0), textAlign: TextAlign.center,),),
          ),
          new Container(
            padding: EdgeInsets.only(top: 0.0, bottom: 10.0,left: 10.0,right: 10.0),
            child: new Center( child:  new Text(_col.desc),),
          )
        ],
      ),
    );
  }
}

class Recommand extends StatefulWidget {
  @override
  State<Recommand> createState() {
    // TODO: implement createState
    return new _Recommand();
  }
}

class _Recommand extends State<Recommand> with TickerProviderStateMixin {
  List<String> _tabTitles;
  List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _tabTitles = <String>['全部', '魔兽', '怪物猎人', '生化危机'];
    List<FlatButton> _cols = recommandList.map((Map<String, String> data) {
      return new FlatButton(
        padding: EdgeInsets.all(0.0),
        onPressed: (){
          Navigator.push(context, new MaterialPageRoute(
            builder: (context){
              return new Post();
            }
          ));
        },
        child: new Container(
        child: RecColumn(new RecommandItem(int.parse(data["uid"]),
            data["title"], data["author"], data["dialog"], data["imgSrc"])),
      ),
      );
    }).toList();

    _pages = <Widget>[
      new ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(0.0),
        children: _cols,
      ),
      // new Container(
      new ListView(
        scrollDirection: Axis.vertical,
        children: _cols,
      ),
      // new Container(
      new ListView(
        scrollDirection: Axis.vertical,
        children: _cols,
      ),
      // new Container(
      new ListView(
        scrollDirection: Axis.vertical,
        children: _cols,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    //  SystemChrome.setSystemUIOverlayStyle(new SystemUiOverlayStyle(
    //   statusBarColor: Colors.black,
    //   statusBarBrightness: Brightness.dark

    // ));
    return new MaterialApp(
      home: new DefaultTabController(
        length: _tabTitles.length,
        child: new Container(
            padding: EdgeInsets.all(0.0),
            margin: EdgeInsets.only(top: 22.0),
            // height: 20.0,
            child: new Scaffold(
              backgroundColor: ybgc,
              appBar: new TabBar(
                indicatorWeight: 3.5,
                indicatorColor: activeColor,
                labelColor: activeColor,
                labelStyle: new TextStyle(color: activeColor),
                unselectedLabelColor: inactiveColor,
                isScrollable: true,
                tabs: _tabTitles.map((String title) {
                  return new Tab(
                    text: title,
                  );
                }).toList(),
              ),
              body: new TabBarView(
                children: _pages.map((page) {
                  return new Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: page,
                  );
                }).toList(),
              ),
            )),
      ),
    );
  }
}
