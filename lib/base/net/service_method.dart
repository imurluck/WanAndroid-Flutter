// jxq

import '../models/article_model.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'api.dart';
import 'dart:convert';


Future getArticleContent() async {
  try {
    print('开始获取文章数据...............');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    response = await dio.get(Apis.HOME_ARTICLE_LIST + "/0/json");
    if (response.statusCode == 200) {
      var data = json.decode(response.toString());
      var model = ArticleModel.fromJson(data);
      return model;
    } else {
      throw Exception('获取文章后端出现异常!');
    }

  } catch (e) {
    print(e);
    throw Exception("获取文章列表失败!");
  }
}