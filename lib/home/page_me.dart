import 'package:flutter/material.dart';

class HomePageMe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageMeState();
  }

}

class HomePageMeState extends State<HomePageMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: Container(
        child: Center(
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
                    '我的',
                    style: TextStyle(fontSize: 20)
                ),
              ),
            )
        ),
      ),
    );
  }

}