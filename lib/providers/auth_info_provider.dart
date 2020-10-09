import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../entities/auth_info_entity.dart';

const authInfoKeyInSharedPreferences = 'authInfo';

/// 登录用户的信息
class AuthInfoProvider with ChangeNotifier {
  AuthInfoEntity _authInfo;
  AuthInfoEntity get authInfo => _authInfo;

  static AuthInfoEntity get unAuth => AuthInfoEntity.unAuth;

  AuthInfoProvider() {
    setup();
  }

  void setup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userString = prefs.getString(authInfoKeyInSharedPreferences) ?? '';
    if (userString == null || userString == '') {
      _authInfo = AuthInfoEntity.unAuth;
    } else {
      _authInfo = AuthInfoEntity.loadFromJSON(jsonDecode(userString));
      var now = DateTime.now().millisecondsSinceEpoch;
      if (now > _authInfo.expired_at) {
        _authInfo = AuthInfoEntity.unAuth;
        await prefs.setString(authInfoKeyInSharedPreferences, '');
      }
    }

    notifyListeners();
  }

  Future login(AuthInfoEntity authInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        authInfoKeyInSharedPreferences, authInfo.toJSONString());
    _authInfo = authInfo;
    notifyListeners();
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(authInfoKeyInSharedPreferences, '');
    _authInfo = AuthInfoEntity.unAuth;
    notifyListeners();
  }
}
