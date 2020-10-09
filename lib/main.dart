import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';

import './pages/home_page/home_page.dart';
import './utils/screen_utils.dart';

import './providers/providers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SPUI.init();

  final authInfoProvider = AuthInfoProvider();
  final settingsProvider = SettingsProvider();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthInfoProvider>.value(value: authInfoProvider),
        ChangeNotifierProvider<SettingsProvider>.value(value: settingsProvider),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'App项目模板'),
      builder: BotToastInit(), //1.调用BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}
