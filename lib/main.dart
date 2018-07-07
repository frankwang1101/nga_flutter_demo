// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import './layout.dart';
import 'package:flutter/services.dart';

class Nga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Layout()
    );
  }
}

void main() {
  // SystemChrome.setSystemUIOverlayStyle(new SystemUiOverlayStyle(
  //   statusBarIconBrightness: Brightness.dark
  // ));
  runApp(new Nga());
}