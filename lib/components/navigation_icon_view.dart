import 'package:flutter/material.dart';

class NavigationIconView {
  NavigationIconView({Widget icon, Widget text, TickerProvider vsync})
      : item = new BottomNavigationBarItem(
          icon: icon,
          title: text,
        ),
        controller = new AnimationController(
            duration: kThemeAnimationDuration, vsync: vsync);

  final BottomNavigationBarItem item;
  final AnimationController controller;
}
