import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wan_android_client/base/style/colors.dart';
import 'package:wan_android_client/home/home_router.dart';
import 'package:wan_android_client/router/app_route.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WanAndroid',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: AppColors.barBackgroundColor,
        accentColor: AppColors.accentColor,
        primaryColorDark: AppColors.barBackgroundColor,
        dividerColor: AppColors.dividerLineColor,
        dialogBackgroundColor: AppColors.windowBackgroundColor
      ),
      routes: AppRoute.appRoute,
      home: HomeRouter(),
    );
  }
}
