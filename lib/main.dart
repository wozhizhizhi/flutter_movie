import 'package:flutter/material.dart';
import 'views/FirstPage.dart';
import 'views/SecondPage.dart';
import 'views/ThirdPage.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Image Picker Demo',
      home: new MyHomeApp(),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  @override
  _MyHomeAppState createState() => new _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  PageController pageController;
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new PageView(
        children: <Widget>[new FirstPage(), new SecondPage(), new ThirdPage()],
        controller: pageController,
        onPageChanged: onPageChance,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text("首页")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.location_on), title: new Text("本地")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.people), title: new Text("我的"))
        ],
        onTap: onTap,
        currentIndex: page
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }

  void onTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChance(int page) {
    setState(() {
      this.page = page;
    });
  }
}
