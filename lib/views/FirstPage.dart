import 'package:flutter/material.dart';
import 'package:flutter_animation/modles/Movie.dart';
import 'package:flutter_animation/networkutil/NetWorkData.dart';
import 'package:flutter_animation/weight/getMoviesGrid.dart';
import 'dart:async';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => new _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Movie> movies;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movies = new List();
    getMovieListData();

  }

  //网络请求
  getMovieListData() async {
    List list = await NetWorkData().getPopulaMovie();
    print('list is a:${list.length}');
    setState(() {
      movies = list;
    });

  }

  Future<Null> _handleRefresh() async {
    await  getMovieListData();
  }

  @override
  Widget build(BuildContext context) {
    var content;
    print('length is a:${movies.length}');
    if (movies.isEmpty)
    {
      content = new Center(child: new CircularProgressIndicator(),);
    }
    else
    {
      content = getMoviesGrid(movies: movies , crossAxisCount: 2 , context: context);
    }
    return new Scaffold(
      appBar: new AppBar(title: new Text("电影介绍"), centerTitle: true),
      body: new RefreshIndicator(child: content, onRefresh: _handleRefresh)
    );
  }
}
