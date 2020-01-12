import 'package:flutter/material.dart';
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
        selectedFontSize: 12.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.whatshot),
              title: Text("热门")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.crop_landscape),
              title: Text("分类")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer),
              title: Text("问答")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.youtube_searched_for),
              title: Text("搜素")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.trip_origin),
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