import 'package:flutter/material.dart';

class HomePageSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageSearchState();
  }

}

class HomePageSearchState extends State<HomePageSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索"),
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
                  '搜索',
                  style: TextStyle(fontSize: 20)
              ),
            ),
          )
      ),
    );
  }

}