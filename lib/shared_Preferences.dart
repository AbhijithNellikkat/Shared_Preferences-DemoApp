// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceService {

  static late final SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  saveString(String name) {
    prefs.setString("data", name);
  
  }

  getString() {
    var name = prefs.getString("data");
    return name;
  }

  
}