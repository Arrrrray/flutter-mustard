import 'dart:async';

import 'package:flutter/material.dart';
import '../../utils/screen_utils.dart';
import '../../assets/hg_images.dart';
import '../../entities/auth_info_entity.dart';
import '../../providers/providers.dart';
import '../../utils/show_toast.dart';
import 'services/login_service.dart';
import '../../widgets/basic/button.dart';

import './providers/login_page_provider.dart';

import './login_page_view.dart';

final mobileRE = new RegExp(r"1[0-9]\d{9}$");
RegExp codeRE = new RegExp(r"\d{4}$");

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginPageProvider>(
      create: (context) => LoginPageProvider(context),
      child: LoginPageView(),
    );
  }
}
