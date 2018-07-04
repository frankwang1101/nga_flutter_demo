import 'package:flutter/material.dart';
import './components/navigation_icon_view.dart';
import './me/index.dart';
import './recommand/index.dart';
import './rate/index.dart';

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

  @override
  void initState() {
    super.initState();
    _pages = <StatefulWidget>[
      new Recommand(),
      new Personal(),
      new Rate(),
    ];
    _icons = <NavigationIconView>[
      new NavigationIconView(
        icon: new Icon(Icons.assessment),
        text: new Text('推荐'),
        vsync: this
      ),
      new NavigationIconView(
        icon: new Icon(Icons.check_circle),
        text: new Text('社区'),
        vsync: this
      ),
      new NavigationIconView(
        icon: new Icon(Icons.crop_square),
        text: new Text('评分'),
        vsync: this
      ),
      new NavigationIconView(
        icon: new Icon(Icons.computer),
        text: new Text('赛事'),
        vsync: this
      ),
      new NavigationIconView(
        icon: new Icon(Icons.person),
        text: new Text('我的'),
        vsync: this
      ),
    ];
    _currentPage = _pages[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: _icons.map((v) => v.item).toList(),
      currentIndex: _currentIndex,
      fixedColor: Colors.yellowAccent,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        print('tap $index');
        setState(() {
          _icons[_currentIndex].controller.reverse();
          _currentIndex = index;
          _icons[_currentIndex].controller.reverse();
          _currentPage = _pages[_currentIndex];
        });
      },
    );
    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: _currentPage,
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
