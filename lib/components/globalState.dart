import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalState {
  final Map<dynamic, dynamic> _data = {};

  StreamController _streamController = new StreamController.broadcast();
  Stream get onStateChanged => _streamController.stream;

  static GlobalState instance = new GlobalState._();
  GlobalState._();

  set(key, value) {
    if (_data[key] != value) {
      _data[key] = value;
      this.setPref(key, value);
      _streamController.add(_data);
    }
  }

  setPref(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      prefs.setString(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    }
  }

  get(key) {
    return _data[key];
  }

  getAll() {
    return JSON.decode(JSON.encode(_data));
  }
}