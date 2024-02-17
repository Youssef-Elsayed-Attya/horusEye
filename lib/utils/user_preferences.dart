import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:horus_eye/app/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:horus_eye/models/user_model.dart';

final img=Myimg().OldEgypt;
final _user = FirebaseAuth.instance.currentUser;
String name=_user!.displayName ??"" ;
String email=_user!.email ??"" ;
class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';


  static final myUser = UserModel(name:name,
      email: email,
      imagePath:img,
      password: '*********');

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(UserModel user) async {
    final json=jsonEncode(user.toJson());
    await _preferences.setString(_keyUser,json);

  }

  static UserModel getUser(){
    final json =_preferences.getString(_keyUser);
    print(json);
    return json==null? myUser: UserModel.fromJson(jsonDecode(json));
  }
}