import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



savePrefs(key,value) async{
  SharedPreferences preferences =await SharedPreferences.getInstance();
  preferences.setBool(key, value);
}
saveStringPrefs(key,value) async{
  SharedPreferences preferences =await SharedPreferences.getInstance();
  preferences.setString(key, value);
}

getPrefs(key)async {
  SharedPreferences preferences =await SharedPreferences.getInstance();
  print('print');
  bool res= preferences.getBool(key)??false;
  print("res=${res}");
  return res;
}
getStringPrefs(key)async {
  SharedPreferences preferences =await SharedPreferences.getInstance();
  print('print');
  var res=  preferences.getString(key);
  print("res=${res}");
  return res;
}