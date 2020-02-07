import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../util/util_route.dart';
import '../style/colors.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:dio/dio.dart';
import 'package:html/dom.dart' as dom;
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';

/// WebView 加载网页页面
class WebViewScreen extends StatefulWidget {
  /// 标题
  String title;

  /// 链接
  String url;

  WebViewScreen({Key key, @required this.title, @required this.url})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new WebViewScreenState();
  }
}

class WebViewScreenState extends State<WebViewScreen> {

  //记录网页加载的进度(0-100)
  int progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

  //加载中的圈圈
  Widget _loadingWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("加载中......"),
            CircularProgressIndicator(
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}
