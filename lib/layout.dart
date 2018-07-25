import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nga_flutter/components/globalState.dart';
import './components/navigation_icon_view.dart';
import './config/globalStyle.dart';
import './me/index.dart';
import './recommand/index.dart';
import './rate/index.dart';
import './community/index.dart';
// import './components/globalState.dart';

class Layout extends StatefulWidget {
  Map _setting;

  Layout(this._setting);

  @override
  State<Layout> createState() {
    return new _Layout(this._setting);
  }
}

class _Layout extends State<Layout> with TickerProviderStateMixin {
  Map _setting;

  _Layout(this._setting);

  int _currentIndex = 0;
  List<StatefulWidget> _pages;
  List<NavigationIconView> _icons;
  StatefulWidget _currentPage;
  GlobalState _gl = GlobalState.instance;
  StreamSubscription _stateSub;
  Color _bottomBarColor;
  Color _fontColor;

  @override
  void initState() {
    super.initState();
    _bottomBarColor = ybgcFoo();
    _fontColor = fontColor();
    _stateSub = _gl.onStateChanged.listen((data) {
      setState(() {
        if (data['night'] != null) {
          nightMode = data['night'];
        }
        this._bottomBarColor = ybgcFoo();
        this._fontColor = fontColor();
        print(data);
      });
    });
    _pages = <StatefulWidget>[
      new Recommand(),
      new Community(),
      new Rate(),
      new Personal(),
    ];
    _icons = <NavigationIconView>[
      new NavigationIconView(
          icon: new Icon(Icons.assessment,
          ),
          text: new Text(
            '推荐',
          ),
          vsync: this),
      new NavigationIconView(
          icon: new Icon(Icons.check_circle,
          ),
          text: new Text(
            '社区',
          ),
          vsync: this),
      new NavigationIconView(
          icon: new Icon(Icons.crop_square,
          ),
          text: new Text(
            '评分',
          ),
          vsync: this),
      // new NavigationIconView(
      //   icon: new Icon(Icons.computer),
      //   text: new Text('赛事', ),
      //   vsync: this
      // ),
      new NavigationIconView(
          icon: new Icon(Icons.person,
          ),
          text: new Text(
            '我的',
          ),
          vsync: this),
    ];
    _currentPage = _pages[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme:
          new ThemeData(canvasColor: _bottomBarColor, primaryColor: _fontColor),
      home: new Scaffold(
        backgroundColor: ybgcFoo(),
        body: new Center(
          child: _currentPage,
        ),
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              canvasColor: _bottomBarColor,
              primaryColor: _fontColor,
              accentColor: _fontColor,
              textTheme: TextTheme(caption: TextStyle(color: _fontColor

              ))),
          child: new BottomNavigationBar(
            items: _icons.map((v){
              return v.item;
            }).toList(),
            currentIndex: _currentIndex,
            fixedColor: activeColor,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              setState(() {
                _icons[_currentIndex].controller.reverse();
                _currentIndex = index;
                _icons[_currentIndex].controller.reverse();
                _currentPage = _pages[_currentIndex];
              });
            },
          ),
        ),
      ),
    );
  }
}
