/// 命名转换：驼峰、下划线
class NameConversion {
  static RegExp regHump = new RegExp(r"[A-Z]"); // 获取大写字母
  static RegExp regUnderscore = RegExp(r"\_+([a-z])"); // 获取 _ 和其之后的第一个字母
  // 驼峰转下划线
  static String humpToUnderscore(String humpStr,
      {bool deleteUnderscore = true}) {
    // 是否删除原有下划线
    String tempStr;

    if (deleteUnderscore) {
      tempStr = humpStr.replaceAll('_', '');
    } else {
      tempStr = humpStr;
    }

    // 将大写字母转为 _ 加小写字母
    return tempStr.replaceAllMapped(regHump, (match) {
      return '_${match.group(0)?.toLowerCase()}';
    });
  }

  // 下划线转驼峰
  static String underscoreToHump(String underscoreStr) {
    return underscoreStr.replaceAllMapped(regUnderscore, (match) {
      return match.group(1)?.toUpperCase() ?? '';
    });
  }
}
