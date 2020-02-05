import 'package:flutter/material.dart';

class ScreenUtil {

  static num getStatusBarHeight(BuildContext context) => MediaQuery.of(context).padding.top;
}