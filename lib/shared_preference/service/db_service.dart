

import 'package:shared_preferences/shared_preferences.dart';

class DBService {

  static Future<bool> setCounter(int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setInt('counter', value);
  }

  static Future<int?> getCounter() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('counter');
  }

  static Future deleteCounter() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('counter');
  }

}