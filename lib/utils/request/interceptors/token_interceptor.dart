// DIO 单例
import 'package:app_template/providers/providers.dart';
import 'package:dio/dio.dart';

import '../../../config/config.dart';
import '../../../providers/providers.dart';

String _getToken() {
  var context = HGConfig.navigatorKey.currentContext;
  var authInfoProvider = Provider.of<AuthInfoProvider>(context, listen: false);
  if (authInfoProvider?.authInfo == null ||
      authInfoProvider.authInfo == AuthInfoProvider.unAuth) {
    return null;
  } else {
    return "${authInfoProvider.authInfo.access_token}";
  }
}

InterceptorsWrapper tokenInterceptor = InterceptorsWrapper(
  onRequest: (RequestOptions options) async {
    var accessToken = _getToken();
    if (accessToken == null) {
      // throw DioError(
      //   type: DioErrorType.RESPONSE,
      //   response: Response(
      //     statusCode: 401,
      //   ),
      // );
    } else {
      options.headers["Authorization"] = 'Token $accessToken';
    }
    return options; //continue
    // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
    // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
    //
    // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
    // 这样请求将被中止并触发异常，上层catchError会被调用。
  },
);
