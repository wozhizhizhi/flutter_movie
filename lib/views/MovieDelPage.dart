import 'package:flutter/material.dart';

class MovieDelPage extends StatefulWidget {
  @override
  _MovieDelPageState createState() => new _MovieDelPageState();
}

class _MovieDelPageState extends State<MovieDelPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("我是详情页"), centerTitle: true),
      body: new Center(child: new Text("详情")),
    );
  }
}
