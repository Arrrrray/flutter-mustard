import 'dart:async';
import 'package:dio/dio.dart';
import '../../../config/config.dart';

import '../../../utils/request/request.dart';

class API {
  // BaseUrl是https://www.hanguangbaihuo.com，不带token
  static final Dio _dioWithoutToken = Request.dioBaseHG;
  // BaseUrl是https://www.hanguangbaihuo.com，并且带token请求
  static final Dio _dio = Request.dioTokenBaseHG;

  ///....用户登录....
  // 发送短信验证码
  static Future<Response> sendSMS({String phone = ''}) {
    return _dioWithoutToken.post('/api/sms/send/', data: {"phone": '$phone'});
  }

  // 通过短信验证码登录
  static Future<Response> loginBySMS({String phone, String code}) {
    return _dioWithoutToken.post('/api/sms/login/', data: {
      "phone": phone,
      "code": code,
      "app_id": HGConfig.app_id,
    });
  }

  ///获取用户详细信息
  static Future<Response> getUserDetail(String accessToken) {
    return _dioWithoutToken.get(
      '/api/sparrow_admin/user/detail/',
      options: Options(
        headers: {
          "Authorization": 'Token $accessToken',
        },
      ),
    );
  }
}
