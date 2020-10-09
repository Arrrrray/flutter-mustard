import 'package:bot_toast/bot_toast.dart';


Function showCustomLoading() {
  var loading = BotToast.showLoading();
  return loading;
}

Future<T> showLoading<T>(Future<T> future) async {
  var loading = BotToast.showLoading();

  try {
    T res = await future;
    return res;
  } catch (e) {
    throw e;
  } finally {
    loading();
  }
}
