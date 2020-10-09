import 'dart:async';

import 'package:flutter/material.dart';
import 'package:app_template/pages/login_page/providers/login_page_provider.dart';
import '../../utils/screen_utils.dart';
import '../../assets/hg_images.dart';
import '../../entities/auth_info_entity.dart';
import '../../providers/providers.dart';
import '../../utils/show_toast.dart';
import 'services/login_service.dart';
import '../../widgets/basic/button.dart';

final mobileRE = new RegExp(r"1[0-9]\d{9}$");
RegExp codeRE = new RegExp(r"\d{4}$");

class LoginPageView extends StatelessWidget {
  Widget _renderPhone(BuildContext context) {
    LoginPageProvider loginPageProvider =
        Provider.of<LoginPageProvider>(context, listen: true);

    return Container(
      width: 690.rpx,
      height: 150.rpx,
      margin: EdgeInsets.only(left: 30.rpx, right: 30.rpx, top: 10.rpx),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: '手机号',
        ),
        style: TextStyle(fontSize: 34.rpx),
        onChanged: (value) {
          loginPageProvider.phone = value;
        },
      ),
    );
  }

  Widget _renderCode(BuildContext context) {
    LoginPageProvider loginPageProvider =
        Provider.of<LoginPageProvider>(context, listen: true);

    int timerCount = loginPageProvider.timeCount;
    var isFetchCodeLoading = loginPageProvider.isFetchCodeLoading;

    String buttonText = '获取验证码';
    bool isFetchCodeButtonEnable = true;

    // 如果在计时中，按钮文本改变，按钮不可用
    if (timerCount > 0) {
      buttonText = '$timerCount 秒后重发';
      isFetchCodeButtonEnable = false;
    }
    // 如果手机号不符合规则 按钮不可用、登录不可用
    if (!mobileRE.hasMatch(loginPageProvider.phone)) {
      isFetchCodeButtonEnable = false;
    }

    if (isFetchCodeLoading) {
      isFetchCodeButtonEnable = false;
    }

    return Container(
      width: 690.rpx,
      height: 150.rpx,
      margin: EdgeInsets.only(left: 30.rpx, right: 30.rpx, top: 20.rpx),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '验证码',
              ),
              style: TextStyle(fontSize: 34.rpx),
              // onChanged: _textFieldChanged,
              autofocus: false,
              onChanged: (value) {
                loginPageProvider.code = value;
              },
            ),
          ),
          FlatButton(
            child: Text(buttonText),
            onPressed: isFetchCodeButtonEnable
                ? loginPageProvider.handleSendSMS
                : null,
          ),
        ],
      ),
    );
  }

  Widget _renderLoginButton(BuildContext context) {
    LoginPageProvider loginPageProvider =
        Provider.of<LoginPageProvider>(context, listen: true);

    bool isLoginButtonEnable = true;

    // 如果手机号不符合规则 按钮不可用、登录不可用
    if (!mobileRE.hasMatch(loginPageProvider.phone)) {
      isLoginButtonEnable = false;
    }
    // 如果验证码格式不匹配，登录不可用
    if (!codeRE.hasMatch(loginPageProvider.code)) {
      isLoginButtonEnable = false;
    }
    // 如果登录Loading，登录按钮不可用
    if (loginPageProvider.isLoginLoading) {
      isLoginButtonEnable = false;
    }

    final theme = Theme.of(context);

    return Container(
      alignment: Alignment.center,
      width: 750.rpx,
      margin: EdgeInsets.only(top: 100.rpx),
      child: RaisedButton(
        child: Text(loginPageProvider.isLoginLoading ? '登录中...' : '登录'),
        color: theme.primaryColor,
        onPressed: isLoginButtonEnable ? loginPageProvider.handleLogin : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录页'),
      ),
      body: ListView(
        children: <Widget>[
          // logo
          LoginPageLogo(),

          // 手机号
          _renderPhone(context),

          // 验证码
          _renderCode(context),

          // 登录按钮
          _renderLoginButton(context),
        ],
      ),
    );
  }
}

class LoginPageLogo extends StatelessWidget {
  const LoginPageLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 750.rpx,
      height: 300.rpx,
      padding: EdgeInsets.all(20.rpx),
      child: Image.asset(
        HGImages.logo,
        width: 260.rpx,
        height: 260.rpx,
      ),
    );
  }
}
