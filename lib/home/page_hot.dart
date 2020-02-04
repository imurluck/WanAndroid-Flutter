import 'package:flutter/material.dart';
import 'package:wan_android_client/base/util/util_toast.dart';

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
      body: Center(
        child: RaisedButton(
          onPressed: () {},
          textColor: Colors.white,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF0D47A1),
                  Color(0xFF1976D2),
                  Color(0xFF42A5F5),
                ],
              ),
            ),
            padding: const EdgeInsets.all(10.0),
            child: const Text(
                '热门',
                style: TextStyle(fontSize: 20)
            ),
          ),
        )
      ),
    );
  }

}