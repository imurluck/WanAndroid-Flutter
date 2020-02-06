import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_client/base/style/colors.dart';
import 'package:wan_android_client/home/page_category.dart';
import 'package:wan_android_client/home/page_hot.dart';
import 'package:wan_android_client/home/page_me.dart';
import 'package:wan_android_client/home/page_qa.dart';
import 'package:wan_android_client/home/page_search.dart';
import 'package:wan_android_client/res/iconfont/AppIcon.dart';

class HomeRouter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return HomeContainer();
  }
}

class HomeContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeContainerState(0);
  }

}

class HomeContainerState extends State<HomeContainer> {

  var currentItemIndex = 0;

  List<Widget> pageList = List();

  HomeContainerState(this.currentItemIndex);

  @override
  void initState() {
    super.initState();
    pageList..add(HomePageHot())
            ..add(HomePageCategory())
            ..add(HomePageQa())
            ..add(HomePageSearch())
            ..add(HomePageMe());
  }

  Widget getCurrentPage() {
    if (currentItemIndex >= pageList.length || currentItemIndex < 0) {
      return null;
    }
    return pageList[currentItemIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getCurrentPage(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentItemIndex,
        selectedItemColor: AppColors.accentColor,
        unselectedItemColor: AppColors.iconColorInactive,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(AppIcon.hot),
              title: Text("热门"),
              backgroundColor: AppColors.barBackgroundColor
          ),
          BottomNavigationBarItem(
              icon: Icon(AppIcon.category),
              title: Text("分类"),
              backgroundColor: AppColors.barBackgroundColor
          ),
          BottomNavigationBarItem(
              icon: Icon(AppIcon.qa),
              title: Text("问答"),
            backgroundColor: AppColors.barBackgroundColor
          ),
          BottomNavigationBarItem(
              icon: Icon(AppIcon.search),
              title: Text("搜素"),
            backgroundColor: AppColors.barBackgroundColor
          ),
          BottomNavigationBarItem(
              icon: Icon(AppIcon.me),
              title: Text("我的"),
            backgroundColor: AppColors.barBackgroundColor
          ),
        ],
        onTap: (index) {
          setState(() {
            currentItemIndex = index;
          });
        },
      ),
    );
  }
}