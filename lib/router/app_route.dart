
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:wan_android_client/user/page_login.dart';

class AppRoute {

  static const ROUTE_LOGIN = "login";

  static Map<String, WidgetBuilder> appRoute = {
    ROUTE_LOGIN: (context) {
      return PageLoginRouter();
    }
  };

  static void navigateToLoginRoute(BuildContext context) {
    Navigator.of(context).pushNamed(ROUTE_LOGIN);
  }
}
