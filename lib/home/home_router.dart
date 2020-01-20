import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_client/base/assets/iconfont/AppIcon.dart';
import 'package:wan_android_client/base/style/colors.dart';

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

  var _currentItem = 0;

  HomeContainerState(this._currentItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentItem,
        selectedItemColor: AppColors.accentColor,
        unselectedItemColor: Color(0xFF8798A6),
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(AppIcon.hot),
              title: Text("热门")
          ),
          BottomNavigationBarItem(
              icon: Icon(AppIcon.category),
              title: Text("分类")
          ),
          BottomNavigationBarItem(
              icon: Icon(AppIcon.qa),
              title: Text("问答")
          ),
          BottomNavigationBarItem(
              icon: Icon(AppIcon.search),
              title: Text("搜素")
          ),
          BottomNavigationBarItem(
              icon: Icon(AppIcon.me),
              title: Text("我的")
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentItem = index;
          });
        },
      ),
    );
  }
}