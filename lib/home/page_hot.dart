// jxq

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_client/base/util/util_toast.dart';
import '../base/net/service_method.dart';
import '../base/models/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiver/strings.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../base/util/util_route.dart';
import 'package:webview_flutter/webview_flutter.dart';



/// 首页热门页面
class HomePageHot extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageHotState();
  }
}

class HomePageHotState extends State<HomePageHot>
    with AutomaticKeepAliveClientMixin {
  int _articlePage = 0;
  List<ArticleItem> _articleItems = [];

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    getArticleList();
    super.initState();
  }

  Future getArticleList() async {
    getArticleListData((ArticleModel model) {
      if (model.errorCode == 0) {
        if (model.data.itemList.length > 0) {
          setState(() {
            _articleItems.addAll(model.data.itemList);
          });
        }
      }
    }, (DioError error) {
      print(error);
    }, _articlePage);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("热门"),
      ),
      body: Container(
        child: EasyRefresh(
          header: MaterialHeader(),
          footer: MaterialFooter(),
          child: ListView(
              children: <Widget>[ArticleItemWidget(articles: _articleItems)]),
          onRefresh: () async {
            // 上拉刷新
          },
          onLoad: () async {
            // 下拉刷新
            print("开始加载更多");
            await getArticleList();
            setState(() {
              ++_articlePage;
            });
          },
        ),
      ),
    );
  }
}

class ArticleItemWidget extends StatelessWidget {
  final List<ArticleItem> articles;

  //final ArticleItem article;

  ArticleItemWidget({Key key, this.articles}) : super(key: key);

  Widget _articleItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        RouteUtil.toWebView(context, item.title, item.link);  // 路由跳转
      },
      child: Container(
        //width: 374,
        //height: 138,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        margin: const EdgeInsets.symmetric(horizontal: 28),
        decoration: BoxDecoration(
            border: Border(
          bottom: Divider.createBorderSide(context, width: 0.7),
        )),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          padding: EdgeInsets.all(0.0),
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipOval(
                      child: Image.network(
                    "https://pic.qqtn.com/up/2017-7/2017072711223761132.jpg",
                    height: 16,
                    width: 16,
                  )),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(
                      height: 17,
                      //width: 47,
                      child: Text(
                        isNotBlank(item.author) ? item.author : "匿名",
                        style: TextStyle(
                          fontSize: 12, // 字体大小
                          color: Color(0xFF2266DB), // 字体颜色
                          wordSpacing: 1, // 字间距
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Container(
                      //margin: EdgeInsets.only(left: 9),
                      padding: EdgeInsets.fromLTRB(9.0, 0, 9.0, 0),
                      //设置 child 居中
                      alignment: Alignment(0, 0),
                      height: 17,
                      //width: 40,
                      //边框设置
                      decoration: new BoxDecoration(
                        //背景
                        color: Color(0xFF2266DB),
                        //设置四周圆角 角度
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        //设置四周边框
                        border:
                            new Border.all(width: 1, color: Color(0xFF2266DB)),
                      ),
                      child: Text(
                        item.superChapterName,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFFFFFFFF),
                          wordSpacing: 0.83,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Container(
                      // margin: EdgeInsets.only(left: 9),
                      padding: EdgeInsets.fromLTRB(9.0, 0, 9.0, 0),
                      //设置 child 居中
                      alignment: Alignment(0, 0),
                      height: 17,
                      //width: 40,
                      //边框设置
                      decoration: new BoxDecoration(
                        //背景
                        color: Color(0xFF2266DB),
                        //设置四周圆角 角度
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        //设置四周边框
                        border:
                            new Border.all(width: 1, color: Color(0xFFFFFFFF)),
                      ),
                      child: Text(
                        item.chapterName,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFFFFFFFF),
                          wordSpacing: 0.83,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                child: Text(
                  item.title,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF5D6472),
                    wordSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                //width: 40,
                height: 14,
                child: Text(item.niceDate,
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF353D4E),
                      wordSpacing: 0.83,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Row(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: ClipOval(
                        child: Image.network(
                          "https://pic.qqtn.com/up/2017-7/2017072711223750856.jpg",
                          height: 16,
                          width: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        height: 14,
                        //width: 44,
                        child: Text(
                          "原创文章",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF353D4E),
                            wordSpacing: 0.83,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ])),
                  Image.asset(
                    "assets/image/Like.png",
                    width: 16,
                    height: 16,
                  ),
                ],
              ),
              Divider(
                height: 0.2,
                indent: 0.0,
                color: Color(0xFF353D4E),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.0),
      child: Container(
        padding: EdgeInsets.all(3.0),
        child: Column(
          children: articles.map((item) {
            return _articleItemUI(context, item);
          }).toList(),
        ),
      ),
    );
  }
}

class MaterialFooter extends Footer {
  final Key key;
  final double displacement;
  final Animation<Color> valueColor;
  final Color backgroundColor;

  final LinkFooterNotifier linkNotifier = LinkFooterNotifier();

  MaterialFooter({
    this.key,
    this.displacement = 40.0,
    this.valueColor,
    this.backgroundColor,
    completeDuration = const Duration(seconds: 1),
    bool enableHapticFeedback = false,
    bool enableInfiniteLoad = true,
  }) : super(
          float: true,
          extent: 52.0,
          triggerDistance: 52.0,
          completeDuration: completeDuration == null
              ? Duration(
                  milliseconds: 300,
                )
              : completeDuration +
                  Duration(
                    milliseconds: 300,
                  ),
          enableHapticFeedback: enableHapticFeedback,
          enableInfiniteLoad: enableInfiniteLoad,
        );

  @override
  Widget contentBuilder(
      BuildContext context,
      LoadMode loadState,
      double pulledExtent,
      double loadTriggerPullDistance,
      double loadIndicatorExtent,
      AxisDirection axisDirection,
      bool float,
      Duration completeDuration,
      bool enableInfiniteLoad,
      bool success,
      bool noMore) {
    linkNotifier.contentBuilder(
        context,
        loadState,
        pulledExtent,
        loadTriggerPullDistance,
        loadIndicatorExtent,
        axisDirection,
        float,
        completeDuration,
        enableInfiniteLoad,
        success,
        noMore);
    return MaterialFooterWidget(
      key: key,
      displacement: displacement,
      valueColor: valueColor,
      backgroundColor: backgroundColor,
      linkNotifier: linkNotifier,
    );
  }
}

class MaterialHeader extends Header {
  final Key key;
  final double displacement;
  final Animation<Color> valueColor;
  final Color backgroundColor;

  final LinkHeaderNotifier linkNotifier = LinkHeaderNotifier();

  MaterialHeader({
    this.key,
    this.displacement = 40.0,
    this.valueColor,
    this.backgroundColor,
    completeDuration = const Duration(seconds: 1),
    bool enableHapticFeedback = false,
  }) : super(
          float: true,
          extent: 70.0,
          triggerDistance: 70.0,
          completeDuration: completeDuration == null
              ? Duration(
                  milliseconds: 300,
                )
              : completeDuration +
                  Duration(
                    milliseconds: 300,
                  ),
          enableInfiniteRefresh: false,
          enableHapticFeedback: enableHapticFeedback,
        );

  @override
  Widget contentBuilder(
      BuildContext context,
      RefreshMode refreshState,
      double pulledExtent,
      double refreshTriggerPullDistance,
      double refreshIndicatorExtent,
      AxisDirection axisDirection,
      bool float,
      Duration completeDuration,
      bool enableInfiniteRefresh,
      bool success,
      bool noMore) {
    linkNotifier.contentBuilder(
        context,
        refreshState,
        pulledExtent,
        refreshTriggerPullDistance,
        refreshIndicatorExtent,
        axisDirection,
        float,
        completeDuration,
        enableInfiniteRefresh,
        success,
        noMore);
    return MaterialHeaderWidget(
      key: key,
      displacement: displacement,
      valueColor: valueColor,
      backgroundColor: backgroundColor,
      linkNotifier: linkNotifier,
    );
  }
}

