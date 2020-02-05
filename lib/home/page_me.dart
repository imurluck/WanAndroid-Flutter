import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wan_android_client/base/style/colors.dart';
import 'package:wan_android_client/router/app_route.dart';
import 'package:wan_android_client/user/login_manager.dart';

class HomePageMe extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return LoginManager.hasLogin() ? HomePageMeState() : HomePageMeNotLogin();
  }

}

class HomePageMeState extends State<HomePageMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: Container(
        child: Center(
            child: RaisedButton(
              onPressed: () {},
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                    '我的',
                    style: TextStyle(fontSize: 20)
                ),
              ),
            )
        ),
      ),
    );
  }

}

class HomePageMeNotLogin extends State<HomePageMe> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image(
                image: AssetImage("assets/image/ic_login_tip.png"),
                width: 50.0,
                height: 50.0,
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0)
              ),
              Text("WanAndroid-Flutter客户端",
                style: TextStyle(
                    fontSize: 14.0,
                    color: AppColors.textColorPrimary
                ),
              )
            ],
          )
        ),
        Align(
          alignment: Alignment(0.0, 0.9),
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: MaterialButton(
              minWidth: double.infinity,
              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
              color: AppColors.accentColor,
              onPressed: () {
                jumpToLoginPage(context);
              },
              textColor: Colors.white,
              child: Text("去登陆")
            ),
          )
        )
      ],
    );
  }

  void jumpToLoginPage(BuildContext context) {
    AppRoute.navigateToLoginRoute(context);
  }

}