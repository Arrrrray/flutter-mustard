import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import './screen_utils.dart';

showToast(String msg) {
  BotToast.showText(text: msg);
}

showToastForException(String msg) {
  BotToast.showText(
    text: msg,
    contentColor: Colors.red,
    textStyle: TextStyle(
      fontSize: 24.rpx,
      color: Colors.white,
    ),
    // align: Alignment.topLeft,
    duration: Duration(
      seconds: 10,
    ),
    clickClose: true,
  );
}

// showFlushBar(BuildContext context) {
//   Flushbar(
//     title: "Hey Ninja",
//     message:
//         "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
//     duration: Duration(seconds: 3),
//     backgroundColor: Colors.red,
//     flushbarPosition: FlushbarPosition.TOP,
//     animationDuration: Duration(microseconds: 500),
//   )..show(context);
// }

showFlushBarForException(BuildContext context) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text('哈哈哈呃呃呃呃呃呃呃呃呃呃呃呃鹅鹅鹅鹅鹅鹅饿鹅鹅鹅饿'),
      action: SnackBarAction(
        label: '关闭',
        onPressed: () {
          Scaffold.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}
