// jxq

// 数据获取
import '../models/article_model.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'api.dart';
import 'dart:convert';

Dio _dio = Dio();

/// 使用默认配置

Dio get dio => _dio;

Future request(url, {formData}) async {
  try {
    print('开始获取数据...............');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    if (formData == null) {
      response = await dio.post(url);
    } else {
      response = await dio.post(url, data: formData);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

void getArticleListData(
    Function callback, Function errorCallback, int _page) async {
  dio.get(Apis.HOME_ARTICLE_LIST + "/$_page/json").then((response) {
    callback(ArticleModel.fromJson(response.data));
  }).catchError((e) {
    errorCallback(e);
  });
}

//Future getArticleContent(int page) async {
//  try {
//    print('开始获取文章数据...............');
//    Response response;
//    Dio dio = new Dio();
//    dio.options.contentType = Headers.formUrlEncodedContentType;
//    response = await dio.get(Apis.HOME_ARTICLE_LIST + "/$page/json");
//    if (response.statusCode == 200) {
//      var data = json.decode(response.toString());
//      var model = ArticleModel.fromJson(data);
//      return model;
//    } else {
//      throw Exception('获取文章后端出现异常!');
//    }
//
//  } catch (e) {
//    print(e);
//    throw Exception("获取文章列表失败!");
//  }
//}
