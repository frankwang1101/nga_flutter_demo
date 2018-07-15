import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './components/navigation_icon_view.dart';
import './config/globalStyle.dart';
import './me/index.dart';
import './recommand/index.dart';
import './rate/index.dart';
import './community/index.dart';
// import './components/globalState.dart';

class Layout extends StatefulWidget {
  @override
  State<Layout> createState() {
    return new _Layout();
  }
}

class _Layout extends State<Layout> with TickerProviderStateMixin {
  int _currentIndex = 0;
  List<StatefulWidget> _pages;
  List<NavigationIconView> _icons;
  StatefulWidget _currentPage;
  // GlobalState _gl = GlobalState.instance;
  // StreamSubscription _stateSub;

  @override
  void initState() {
    super.initState();
    // _stateSub = _gl.onStateChanged.listen((data){
    //   print('change..layout..$data');
    // });
    _pages = <StatefulWidget>[
      new Recommand(),
      new Community(),
      new Rate(),
      new Personal(),
    ];
    _icons = <NavigationIconView>[
      new NavigationIconView(
        icon: new Icon(Icons.assessment),
        text: new Text('推荐', style: TextStyle(color: fontColor()),),
        vsync: this
      ),
      new NavigationIconView(
        icon: new Icon(Icons.check_circle),
        text: new Text('社区', style: TextStyle(color: fontColor()),),
        vsync: this
      ),
      new NavigationIconView(
        icon: new Icon(Icons.crop_square),
        text: new Text('评分', style: TextStyle(color: fontColor()),),
        vsync: this
      ),
      // new NavigationIconView(
      //   icon: new Icon(Icons.computer),
      //   text: new Text('赛事', style: TextStyle(color: fontColor()),),
      //   vsync: this
      // ),
      new NavigationIconView(
        icon: new Icon(Icons.person),
        text: new Text('我的', style: TextStyle(color: fontColor()),),
        vsync: this
      ),
    ];
    _currentPage = _pages[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new  BottomNavigationBar(
      items: _icons.map((v) => v.item).toList(),
      currentIndex: _currentIndex,
      fixedColor: activeColor,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        setState(() {
          _icons[_currentIndex].controller.reverse();
          _currentIndex = index;
          _icons[_currentIndex].controller.reverse();
          _currentPage = _pages[_currentIndex];
        });
      },
    );
    return new MaterialApp(
      theme: new ThemeData(
        canvasColor: sybgcFoo()
      ),
      home: new Scaffold(
        backgroundColor: ybgcFoo(),
        body: new Center(
          child: _currentPage,
        ), bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
            canvasColor: sybgcFoo()
          ),

          child: bottomNavigationBar,
        ),
      ),
    );
  }
}
