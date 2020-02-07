// jxq

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widget/browser.dart';

// 文章路由跳转工具
class RouteUtil {
  static void push(BuildContext context, Widget page) async {
    if (context == null || page == null) {
      return;
    }

    await Navigator.push(context, new CupertinoPageRoute<void>(builder: (context) => page));
  }

  /// 跳转到 WebView 打开
  static void toWebView(BuildContext context, String title, String url) async {
    if (context == null || url.isEmpty) return;
    if (url.endsWith('.apk')) {
      launchInBrowser(url, title: title);
    } else {
      await Navigator.of(context)
          .push(new CupertinoPageRoute<void>(builder: (context) {
        return new WebViewScreen(
          title: title,
          url: url,
        );
      }));
    }
  }

  static launchURL(String url) async{
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<Null> launchInBrowser(String url, {String title}) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}
