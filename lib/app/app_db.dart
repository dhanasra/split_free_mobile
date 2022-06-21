import 'package:shared_preferences/shared_preferences.dart';

/*
AppDB is local storage class of App
 */
class AppDB{

  /*
  Add a new item to storage with key
  */
  static Future<void> add({required String key,required dynamic value,dynamic type}) async {
    final prefs = await SharedPreferences.getInstance();
    switch(type??value.runtimeType){
      case String: await prefs.setString(key, value);
      break;
      case double: await prefs.setDouble(key, value);
      break;
      case int: await prefs.setInt(key, value);
      break;
      case bool: await prefs.setBool(key, value);
      break;
      case List<String>: await prefs.setStringList(key, value);
      break;
    }
  }

  /*
  Get a new item to storage with key
  */
  static Future<dynamic> get({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key)
        ?? prefs.getInt(key)
        ?? prefs.getBool(key)
        ?? prefs.getDouble(key)
        ?? prefs.getStringList(key);
  }

  /*
  Remove a new item to storage with key
  */
  static Future<void> remove({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

}