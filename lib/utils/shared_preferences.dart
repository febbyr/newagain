import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static set(String key, String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString(key, value);
  }

  static setBool(String key, bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setBool(key, value);
  }

  static get(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String res = pref.getString(key);

    return res;
  }

  static getBool(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    bool res = pref.getBool(key);

    return res;
  }

  static clear(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.remove(key);
  }
}
