import 'package:dio/dio.dart';
import '../../sparrow_utils.dart';
import '../../show_toast.dart';

void _handleTimeOutError(DioErrorType type, RequestOptions request) {
  var msg;
  switch (type) {
    case DioErrorType.CONNECT_TIMEOUT:
      // 连接超时
      msg = "连接超时";
      break;
    case DioErrorType.RECEIVE_TIMEOUT:
      // 接收超时
      msg = "接收数据超时";
      break;
    case DioErrorType.SEND_TIMEOUT:
      // 发送超时
      msg = "发送数据超时";
      break;
    case DioErrorType.CANCEL:
      // 请求取消
      msg = "请求取消";
      break;
    default:
      msg = "";
  }
  showToast(msg);
  SPUtils.print('${type}');
  if (request != null) {
    SPUtils.print('');
    SPUtils.print('================');
    SPUtils.print('${request.method} ${request.baseUrl + request.path}');
    SPUtils.print('RequestQuery:${request.queryParameters}');
    SPUtils.print('RequestBody:${request.data}');
    SPUtils.print("ERROR: $msg");
  }
}

// 打印日志
InterceptorsWrapper logInterceptor = InterceptorsWrapper(
  // 在请求被发送之前做一些事情
  onRequest: (RequestOptions options) async {
    SPUtils.print('');
    // SPUtils.print(
    //     '===开始请求===${options.method} ${options.baseUrl + options.path}');

    return options;
    // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
    // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
    //
    // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
    // 这样请求将被中止并触发异常，上层catchError会被调用。
  },

  // 在返回响应数据之前做一些预处理
  onResponse: (Response response) async {
    final request = response.request;
    SPUtils.print('');
    SPUtils.print(
        '===请求返回===${request.method} ${request.baseUrl + request.path}');
    SPUtils.print('RequestQuery:${request.queryParameters}');
    SPUtils.print('RequestBody:${request.data}');
    SPUtils.print('Status: ${response.statusCode}');
    // SPUtils.print('用时: ${requestEndTime - requestBeginTime}ms');
    return response; // continue
  },

  // 错误预处理
  onError: (DioError error) async {
    final request = error.request;
    final response = error.response;
    SPUtils.print('');
    SPUtils.print(
        '===请求出错===${request.method} ${request.baseUrl + request.path}');
    switch (error.type) {
      case DioErrorType.CONNECT_TIMEOUT:
      case DioErrorType.RECEIVE_TIMEOUT:
      case DioErrorType.SEND_TIMEOUT:
      case DioErrorType.CANCEL:
        // 非业务错误
        _handleTimeOutError(error.type, error.request);
        return null;
      case DioErrorType.DEFAULT:
      case DioErrorType.RESPONSE:
      default:
      // 业务错误 go on
    }

    SPUtils.print('ErrorMessage:${error.message}');

    if (request != null) {
      SPUtils.print('');
      SPUtils.print('================');
      SPUtils.print('${request.method} ${request.baseUrl + request.path}');
      SPUtils.print('RequestBody:${request.data}');
    }

    if (response == null) {
      SPUtils.print('请求失败，而且response为null');

      return null;
    }

    SPUtils.print('Status: ${response.statusCode}');
    SPUtils.print('$response');

    if (response.statusCode == 401) {
      // TODO 401 token过期怎么处理
      // handeTokenInvalid();
      return null;
    }

    var errorData = response.data;

    var message = errorData['err_msg'] ??
        errorData['message'] ??
        errorData['msg'] ??
        '错误的错误信息';
    var code = response.statusCode;
    showToastForException('请求异常 $code $message');

    return null;
  },
);
