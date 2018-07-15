import 'package:flutter/material.dart';

bool nightMode = false;
Border bGrey = Border.all(color: Colors.grey, width: 1.0);
BoxDecoration boxGrey = BoxDecoration(border: bGrey);
// 背景色
Color ybgc = rgb(243, 235, 206, 1.0);
Color dybgc = Color.fromARGB(255, 254, 252, 227);
Color sybgc = rgb(255, 247, 227, 1.0);
// 边界颜色
Color bdcDark = rgb(160,160,160);
// 普通字体颜色
Color f1 = Color(0xffb2b2b2);
Color f2 = Color(0xff363229);
// uid字体颜色
Color uidc = rgb(88, 85, 69);
Color uidcDart = rgb(88, 85, 69);
// 激活颜色
Color activeColor = rgb(235, 185, 115);
// 未激活颜色
Color inactiveColor = rgb(160, 160, 160);

ybgcFoo(){
  return nightMode ? rgb(44, 47, 53) : ybgc;
}
sybgcFoo(){
  return nightMode ? rgb(30,32,37) : sybgc;
}
dybgcFoo() {
  return nightMode ? Color(0xff282f34) : dybgc;
}
bdcFoo(){
  return nightMode ? bdcDark : ybgc;
}
uidcFoo(){
  return nightMode ? uidcDart : uidc;
}
fontColor(){
  return nightMode? f1: f2;
}

Map<String, String> homepageMap = {
  "recommand": "推荐",
  "community": "社区",
};

btext(text, [margin = null, padding = null]) => new Container(
      margin: margin,
      padding: padding,
      child: new Text(text),
    );
rgb(r, g, b, [o = 1.0]) => Color.fromRGBO(r, g, b, o);

back(context, [state]) {
  Navigator.pop(context, state);
}

class ColorPick {
  Map _data = {
    "sybgc": [rgb(30,32,37), sybgc],
    "ybgc": [rgb(44, 47, 53), sybgc],
    "dybgc": [rgb(126, 123, 229), sybgc],
    "bgc": [bdcDark, ybgc],
    "uidc": [uidcDart, uidc],
    "fontColor": [f1,f2]
  };

  get(key){
    return nightMode ? _data[key[0]] : _data[key[1]];
  }
}
