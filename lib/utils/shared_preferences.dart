/// 本地存储工具
import 'package:shared_preferences/shared_preferences.dart';
import '../config/text_constants.dart';

class SharedPreferencesUtil {
  // token 字符串
  static String _token = '';

  // 获取 token 值
  static Future getToken() async {
    if (_token == null || _token.isEmpty) {
      // 从本地获取token的值
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      _token = sharedPreferences.getString(TextConstants.token);
    }
    return _token;
  }

  // 设置 token 值
  static Future setToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(TextConstants.token, token);
  }
}
