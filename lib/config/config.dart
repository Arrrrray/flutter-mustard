import 'package:flutter/material.dart';

enum HGEnviroment {
  production,
  development,
}

const hosts = {
  HGEnviroment.production: 'https://backend5.hanguangbaihuo.com',
  HGEnviroment.development: 'https://backend5.dongyouliang.com',
};

class HGConfig {
  // static const env = HGEnviroment.production;
  static const env = HGEnviroment.development;

  static const app_id = 'app_1521010788';

  static final String host = hosts[HGConfig.env];

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}
