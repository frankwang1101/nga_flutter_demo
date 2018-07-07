import 'package:flutter/material.dart';
import '../config/globalStyle.dart';

commonAppBar(List<String> _tabTitles) {
  return new AppBar(
          brightness: Brightness.light,
          backgroundColor: sybgc,
          centerTitle: false,
          title: new Text('论坛', style: new TextStyle(color: Colors.black),),
          // title: const Text('Tabbed AppBar'),
          bottom: new PreferredSize(
            preferredSize: new Size(360.0, 30.0),
            child: new TabBar(
            indicatorWeight: 2.7,
            indicatorColor: activeColor,
            labelColor: activeColor,
            labelStyle: new TextStyle(
              color: activeColor
            ),
            unselectedLabelColor: inactiveColor,
            isScrollable: true,
            tabs: _tabTitles.map((title) {
              return new Container(
                height: 28.0,
                padding: EdgeInsets.only(bottom: 10.0),
                child: new Text(title),);
            }).toList(),
          ),
          )
        );
}
