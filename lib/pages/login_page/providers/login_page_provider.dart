import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../../../providers/providers.dart';

import '../services/login_service.dart';
import '../../../utils/show_toast.dart';
import '../../../entities/auth_info_entity.dart';

const authInfoKeyInSharedPreferences = 'authInfo';

/// 登录用户的信息
class LoginPageProvider extends ChangeNotifier {
  BuildContext context;

  /// 发送短信Loading
  bool isFetchCodeLoading = false;

  /// 登录操作Loading
  bool isLoginLoading = false;

  /// 验证码倒计时
  int _timerCount = 0;
  get timeCount => _timerCount;

  /// 验证码定时器
  Timer _timer;

  // 输入框-手机号
  String _phone = '';
  get phone => _phone;
  set phone(String value) {
    _phone = value;
    notifyListeners();
  }

  // 输入框-验证码
  String _code = '';
  get code => _code;
  set code(String value) {
    _code = value;
    notifyListeners();
  }

  /// 构造函数
  LoginPageProvider(this.context);

  /// 销毁的处理函数（页面退出时，自动调用）
  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }
    print("dispose.....");
    super.dispose();
  }

  /// 启动定时器
  _startTimer() {
    _timerCount = 60;

    _timer = Timer.periodic(
      Duration(seconds: 1),
      (_) {
        if (_timerCount < 1) {
          _timerCount = 0;
          _timer.cancel();
        } else {
          _timerCount = _timerCount - 1;
        }
        notifyListeners();
      },
    );
  }

  /// 处理函数-点击获取验证码
  handleSendSMS() async {
    isFetchCodeLoading = true;
    notifyListeners();

    final res = await API.sendSMS(phone: phone);
    isFetchCodeLoading = false;
    notifyListeners();

    // 开始计时
    if (res?.data['code'] == 0) {
      _startTimer();
      showToast("发送成功");
    } else {
      showToast("发送失败");
    }
  }

  /// 处理函数-点击登录按钮
  handleLogin() async {
    isLoginLoading = true;
    try {
      final authRes = await API.loginBySMS(phone: phone, code: code);

      AuthInfoEntity userData = AuthInfoEntity.createFromJSON(authRes.data);
      final userRes = await API.getUserDetail(userData.access_token);
      userData.name =
          userRes.data["user"] == null ? "" : userRes.data["user"]["name"];

      var authInfoProvider = Provider.of<AuthInfoProvider>(context);
      await authInfoProvider.login(userData);

      showToast("登录成功");

      Navigator.of(context).pop();
    } catch (e) {
      showToast('验证码错误');
    } finally {
      isLoginLoading = false;
    }
  }
}
