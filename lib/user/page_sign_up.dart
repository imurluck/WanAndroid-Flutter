import 'package:flutter/material.dart';
import 'package:wan_android_client/base/style/colors.dart';
import 'package:wan_android_client/res/values/strings.dart';

class PageSignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PageSignUpState();
  }

}

class PageSignUpState extends State<PageSignUp> with TickerProviderStateMixin {

  AnimationController _titleAlphaAnimationController;
  Animation<double> _titleAlphaAnimation;

  AnimationController _passwordConfirmAC;
  Animation<Offset> _passwordConfirmAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  void _initAnimation() {
    _titleAlphaAnimationController = AnimationController(
        duration: Duration(milliseconds: 1000),
        vsync: this
    );
    _titleAlphaAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(_titleAlphaAnimationController);
    _titleAlphaAnimationController.forward();

    _passwordConfirmAC = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this
    );
    _passwordConfirmAnimation = Tween<Offset>(begin: Offset(1.0, 0), end: Offset.zero)
      .animate(_passwordConfirmAC);
    _passwordConfirmAC.forward();
  }

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
                FadeTransition(
                  opacity: _titleAlphaAnimation,
                  child: Text(AppString.SIGN_UP_TITLE, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                        color: AppColors.barBackgroundColor,
                        borderRadius: BorderRadius.all(Radius.elliptical(5.0, 5.0))
                    ),
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: AppString.LOGIN_USER_NAME_HINT,
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person, color: AppColors.textColorSecondary)
                      ),
                      keyboardType: TextInputType.emailAddress,
                    )
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                      color: AppColors.barBackgroundColor,
                      borderRadius: BorderRadius.all(Radius.elliptical(5.0, 5.0))
                  ),
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                        hintText: AppString.LOGIN_PASSWORD_HINT,
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock, color: AppColors.textColorSecondary)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                SlideTransition(
                  position: _passwordConfirmAnimation,
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                      color: AppColors.barBackgroundColor,
                      borderRadius: BorderRadius.all(Radius.elliptical(5.0, 5.0)),
                    ),
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: AppString.LOGIN_PASSWORD_CONFIRM_HINT,
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock, color: AppColors.textColorSecondary)
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 60.0)),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: MaterialButton(
                      onPressed: (){},
                      textColor: Colors.white,
                      color: AppColors.accentColor,
                      minWidth: double.infinity,
                      padding: EdgeInsets.only(left: 100.0, top: 10, right: 100.0, bottom: 10),
                      child: Text(
                          AppString.SIGN_UP_TITLE
                      )
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _titleAlphaAnimationController.dispose();
    _passwordConfirmAC.dispose();
    super.dispose();
  }
}