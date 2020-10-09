// DIO 单例
import 'package:dio/dio.dart';
import 'package:app_template/config/config.dart';

import '../../config/config.dart';

import './interceptors/log_interceptor.dart';
import './interceptors/token_interceptor.dart';

class Request {
  // 标记dio是否初始化完成
  static bool _isInit = false;

  static BaseOptions _baseOptions = BaseOptions(
    connectTimeout: 50000,
    receiveTimeout: 30000,
  );

  static BaseOptions _baseOptionsWithBaseUrl = _baseOptions.merge(
    baseUrl: HGConfig.host,
  );

  /// 建议在项目中使用Dio单例，这样便可对同一个dio实例发起的所有请求进行统一的配置，
  /// 比如设置公共header、请求基地址、超时时间等；
  // 默认dio实例
  static Dio _dio = Dio(_baseOptions);
  // 请求需要带token
  static Dio _dioToken = Dio(_baseOptions);
  // 不带token、baseUrl是https://www.hanguangbaihuo.com
  static Dio _dioBaseHG = Dio(_baseOptionsWithBaseUrl);
  // 请求需要带token、baseUrl是https://www.hanguangbaihuo.com
  static Dio _dioTokenBaseHG = Dio(_baseOptionsWithBaseUrl);

  /// 初始化dio，增加拦截器，拦截器在每个请求是都会处理的函数，类似钩子函数
  /// 分为三个阶段 请求前、返回结果时，出现错误时。
  /// 此时有的功能
  /// 1. 三个阶段均打印日志
  /// 2. 请求前向headers里增加token，token是每个请求时从全局变量获取

  static Dio _dioInit() {
    if (!_isInit) {
      // 打印日志
      _dio.interceptors.add(logInterceptor);
      _dioToken.interceptors.add(logInterceptor);
      _dioBaseHG.interceptors.add(logInterceptor);
      _dioTokenBaseHG.interceptors.add(logInterceptor);

      // 请求前向header中 设置token
      _dioToken.interceptors.add(tokenInterceptor);
      _dioTokenBaseHG.interceptors.add(tokenInterceptor);

      _isInit = true;
    }
    return null;
  }

  // 默认dio实例
  static Dio get dio => _dioInit() ?? _dio;

  // 请求需要带token
  static Dio get dioToken => _dioInit() ?? _dioToken;

  // 不带token、baseUrl是https://www.hanguangbaihuo.com
  static Dio get dioBaseHG => _dioInit() ?? _dioBaseHG;

  // 请求需要带token、baseUrl是https://www.hanguangbaihuo.com
  static Dio get dioTokenBaseHG => _dioInit() ?? _dioTokenBaseHG;
}
