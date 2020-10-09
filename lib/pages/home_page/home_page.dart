import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../routes.dart';

import '../../providers/providers.dart';
import '../../entities/auth_info_entity.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthInfoProvider authInfoProvider = Provider.of<AuthInfoProvider>(context);

    AuthInfoEntity authInfo = authInfoProvider.authInfo;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (authInfo == AuthInfoEntity.unAuth || authInfo == null)
              // 登录
              RaisedButton(
                onPressed: () {
                  HGRoutes.login(context);
                },
                child: Text("登录"),
              )
            else
              RaisedButton(
                onPressed: () {
                  authInfoProvider.logout();
                },
                child: Text("当前用户：${authInfo.phone}. 退出登录"),
              ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
