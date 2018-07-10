import 'package:flutter/material.dart';

Border bGrey = Border.all(color: Colors.grey, width: 1.0);
BoxDecoration boxGrey = BoxDecoration(border: bGrey);
Color ybgc = rgb(243, 235, 206, 1.0);
Color dybgc = rgb(245,225,196);
Color sybgc = rgb(255, 247, 227, 1.0);
Color activeColor = rgb(235, 185, 115);
Color inactiveColor = rgb(160, 160, 160);

btext(text, [margin = null, padding = null]) => new Container(
      margin: margin,
      padding: padding,
      child: new Text(text),
    );
rgb(r, g, b, [o = 1.0]) => Color.fromRGBO(r, g, b, o);

back(context) {
  Navigator.pop(context);
}
