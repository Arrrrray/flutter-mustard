import 'dart:convert';

class AuthInfoEntity {
  final String access_token;
  final String phone;
  final String user_id;
  String name;
  final int expired_in; // 过期时间 秒
  final int created_at; // 大致的创建时间，接口请求返回的时间
  final int expired_at; // 大致的过期时间，接口请求返回的时间 + 过期时间 - 5分钟

  static AuthInfoEntity unAuth = AuthInfoEntity.createFromJSON({});

  AuthInfoEntity.createFromJSON(Map<String, dynamic> json)
      : access_token = json['access_token'],
        phone = json['phone'],
        user_id = json['user_id'],
        name = json['name'] ?? '',
        expired_in = json['expired_in'],
        created_at = DateTime.now().millisecondsSinceEpoch,
        expired_at = json['expired_in'] == null
            ? 0
            : DateTime.fromMillisecondsSinceEpoch(json['expired_in'] * 1000 +
                    DateTime.now().millisecondsSinceEpoch -
                    300000)
                .millisecondsSinceEpoch;

  AuthInfoEntity.loadFromJSON(Map<String, dynamic> json)
      : access_token = json['access_token'],
        phone = json['phone'],
        user_id = json['user_id'],
        name = json['name'] ?? "",
        expired_in = json['expired_in'],
        created_at = json['created_at'],
        expired_at = json['expired_at'];

  Map<String, dynamic> toJSON() {
    return {
      "access_token": access_token,
      "phone": phone,
      "user_id": user_id,
      "name": name ?? "",
      "expired_in": expired_in,
      "created_at": created_at,
      "expired_at": expired_at
    };
  }

  String toJSONString() {
    return jsonEncode(this.toJSON());
  }
}
