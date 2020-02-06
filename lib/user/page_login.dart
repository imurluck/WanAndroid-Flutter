import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wan_android_client/base/style/colors.dart';
import 'package:wan_android_client/res/values/strings.dart';
import 'package:wan_android_client/user/page_sign_up.dart';

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 50)),
                Hero(
                  tag: AppString.ANIMATION_TAG_LOGIN_TITLE,
                  child: Text(AppString.LOGIN_TITLE,
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                        color: AppColors.barBackgroundColor,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(5.0, 5.0))),
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: AppString.LOGIN_USER_NAME_HINT,
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person,
                              color: AppColors.textColorSecondary)),
                      keyboardType: TextInputType.emailAddress,
                    )),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                      color: AppColors.barBackgroundColor,
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(5.0, 5.0))),
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                        hintText: AppString.LOGIN_PASSWORD_HINT,
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock,
                            color: AppColors.textColorSecondary)),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 60.0)),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: MaterialButton(
                      onPressed: () {
                        onLoginBtnTap(context);
                      },
                      textColor: Colors.white,
                      color: AppColors.accentColor,
                      minWidth: double.infinity,
                      padding: EdgeInsets.only(
                          left: 100.0, top: 10, right: 100.0, bottom: 10),
                      child: Text(AppString.LOGIN_TITLE)),
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment(0.0, 0.9),
              child: Container(
                  padding: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 40.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: RichText(
                        text: TextSpan(
                            text: AppString.SIGN_UP_TIP,
                            style: TextStyle(
                                fontSize: 14.0,
                                color: AppColors.textColorSecondary),
                            children: <TextSpan>[
                          TextSpan(
                              text: AppString.SIGN_UP_TIP_OP,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.accentColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                                _navigationToSignUpPage(context);
                            }),
                        ])),
                  )))
        ],
      ),
    );
  }

  void _navigationToSignUpPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PageSignUp();
    }));
  }

  void onLoginBtnTap(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PageSignUp();
    }));
  }
}
