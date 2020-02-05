
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_client/base/style/colors.dart';
import 'package:wan_android_client/base/util/util_screen.dart';

class PageLoginRouter extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageLogin();
  }

}

class PageLogin extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PageLoginState();
  }

}

class PageLoginState extends State<PageLogin> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.windowBackgroundColor,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: ScreenUtil.getStatusBarHeight(context) + 50,
              color: AppColors.barBackgroundColor,
              padding: EdgeInsets.only(top: ScreenUtil.getStatusBarHeight(context)),
            ),
          )
        ],
      )
    );
  }

}