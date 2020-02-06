// jxq

import 'package:flutter/material.dart';
import 'package:wan_android_client/base/util/util_toast.dart';
import '../base/net/service_method.dart';
import '../base/models/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiver/strings.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 首页热门页面
class HomePageHot extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageHotState();
  }
}

class HomePageHotState extends State<HomePageHot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("热门"),
      ),
      body: Container(
        child: FutureBuilder(
          future: getArticleContent(),
          builder: (content, snapshot) {
            if (snapshot.hasData) {
              List<ArticleItem> _articleItems = snapshot.data.data.itemList;
              // print(_articleItems.length);
              return SingleChildScrollView(
                child: Center(
                    child: Column(children: <Widget>[
                  ArticleItemWidget(articles: _articleItems)
                ])),
              );
            } else {
              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                    new SpinKitRing(
                      color: Colors.blueAccent,
                      size: 40.0,
                    ),
                  ]));
            }
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
        print("点击");
      },
      child: Container(
        width:374,
        height: 121,
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
                      width: 47,
                      child: Text(
                        isNotBlank(item.author) ? item.author : "匿名",
                        style: TextStyle(
                          fontSize: 12, // 字体大小
                          color: Color(0xFF2266DB), // 字体颜色
                          wordSpacing: 1, // 字间距
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(
                      margin: EdgeInsets.only(left: 9),
                      //设置 child 居中
                      alignment: Alignment(0, 0),
                      height: 17,
                      width: 40,
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
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Container(
                      margin: EdgeInsets.only(left: 9),
                      //设置 child 居中
                      alignment: Alignment(0, 0),
                      height: 17,
                      width: 40,
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (item.envelopePic.isEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 7),
                  child: ArticleTitleWidget(item.title),
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ArticleTitleWidget(item.title),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            item.desc,
                            style: Theme.of(context).textTheme.caption,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Image.network(
                      item.envelopePic,
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),
              Container(
                width: 40,
                height: 14,
                child: Text(item.niceDate,
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF353D4E),
                      wordSpacing: 0.83,
                    )),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Row(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
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
                        width: 44,
                        child: Text(
                          "原创文章",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF353D4E),
                            wordSpacing: 0.83,
                          ),
                        ),
                      ),
                    )
                  ])),
                  Image.asset("assets/image/Like.png",
                    width: 16,
                    height: 16,
                  ),
                ],
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

class ArticleTitleWidget extends StatelessWidget {
  final String title;

  ArticleTitleWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Html(
      padding: EdgeInsets.symmetric(vertical: 5),
      useRichText: false,
      data: title,
      defaultTextStyle: Theme.of(context).textTheme.subtitle,
      linkStyle: TextStyle(
        fontSize: 12,
        color: Color(0xFF5D6472),
        wordSpacing: 1,
      ),
    );
  }
}
