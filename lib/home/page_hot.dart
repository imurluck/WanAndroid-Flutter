// jxq

import 'package:flutter/material.dart';
import 'package:wan_android_client/base/util/util_toast.dart';
import '../base/net/service_method.dart';
import '../base/models/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiver/strings.dart';
import 'package:flutter_html/flutter_html.dart';

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
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getArticleContent(),
          builder: (content, snapshot) {
            if (snapshot.hasData) {
              List<ArticleItem> _articleItems = snapshot.data.data.itemList;
              return SingleChildScrollView(
                child: Column(children: <Widget>[
                  ArticleItemWidget(articles: _articleItems)
                ]),
              );
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
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Material(
              child: InkWell(
                onTap: () {
                  print("点击");
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
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
                              height: 20,
                              width: 20,
                            )),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                isNotBlank(item.author) ? item.author : "匿名",
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                //设置 child 居中
                                alignment: Alignment(0, 0),
                                height: 25,
                                width: 60,
                                //边框设置
                                decoration: new BoxDecoration(
                                  //背景
                                  color: Colors.blue,
                                  //设置四周圆角 角度
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  //设置四周边框
                                  border: new Border.all(
                                      width: 1, color: Colors.blue),
                                ),
                                child: Text(
                                  item.superChapterName,
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                //设置 child 居中
                                alignment: Alignment(0, 0),
                                height: 25,
                                width: 60,
                                //边框设置
                                decoration: new BoxDecoration(
                                  //背景
                                  color: Colors.blue,
                                  //设置四周圆角 角度
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  //设置四周边框
                                  border: new Border.all(
                                      width: 1, color: Colors.blue),
                                ),
                                child: Text(
                                  item.chapterName,
                                  style: TextStyle(fontSize: 10),
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
                                      style:
                                          Theme.of(context).textTheme.caption,
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
                        Text(item.niceDate, style: Theme.of(context).textTheme.overline,),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: ClipOval(
                                child: Image.network(
                                  "https://pic.qqtn.com/up/2017-7/2017072711223750856.jpg",
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                "原创文章",
                                style: Theme.of(context).textTheme.overline,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ), //),
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.0),
      child: Container(
        padding: EdgeInsets.all(3.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
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
    );
  }
}
