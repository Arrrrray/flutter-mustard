library sparrow_utils;

import 'package:flutter/material.dart';

import 'package:intl/intl.dart' show DateFormat;

import 'package:enum_to_string/enum_to_string.dart';

export 'package:intl/intl.dart' show DateFormat;

export './string_utils.dart';

export './image_suffix.dart';

class SPUtils {
  // map
  static Iterable<E> map<E, T>(
      Iterable<T> items, E Function(int index, T item) fn) sync* {
    var index = 0;

    for (final item in items) {
      yield fn(index, item);
      index = index + 1;
    }
  }

  // static get DateFormat => DateFormat;

  static formatDate(DateTime dt, String format) {
    return DateFormat(format).format(dt);
  }

  static String enumToString(enumItem) {
    return EnumToString.parse(enumItem);
  }

  static T enumFromString<T>(List<T> enumValues, String str, {T defaultValue}) {
    if (str == null) return defaultValue;

    T result = EnumToString.fromString(enumValues, str);

    return result ?? defaultValue;
  }

  static String dateTimeNowIso() => DateTime.now().toIso8601String();

  static int dateTimeNowMilli() => DateTime.now().millisecondsSinceEpoch;

  // 打印内容，分段打印，因为dart默认打印有最大长度
  static print(dynamic message) {
    if (message != null) {
      var content = message.toString();
      if (content == '') {
        debugPrint('${dateTimeNowIso()} ');
        return;
      }
      while (content.length > 800) {
        debugPrint('${dateTimeNowIso()} ${content.substring(0, 800)}');
        content = content.substring(800, content.length);
      }
      if (content != '') debugPrint('${dateTimeNowIso()} $content');
    }
  }
}
