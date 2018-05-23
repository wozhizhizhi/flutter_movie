import 'package:flutter/material.dart';
import 'package:flutter_animation/modles/Movie.dart';
import 'package:flutter_animation/modles/MovieDetail.dart';
import 'package:flutter_animation/networkutil/NetWorkData.dart';

class MovieDelPage extends StatefulWidget {

  final Movie movie;
  MovieDelPage(this.movie);

  @override
  _MovieDelPageState createState() => new _MovieDelPageState();
}

class _MovieDelPageState extends State<MovieDelPage> {
  MovieDetail movieDetail;
  List<MovieDetail> movieDels;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovieDetaiListData();

  }
  @override
  Widget build(BuildContext context) {
    var content;
    if (movieDetail == null){
      content = new Center(child: new CircularProgressIndicator());
    }
    else{
      content = setData(movieDetail);
    }
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.movie.title), centerTitle: true),
      body: content,
    );
  }

  //网络请求
  getMovieDetaiListData() async {
   MovieDetail movieDel = await NetWorkData().getMovieDetail(
        widget.movie.id);
   print("moviedel is a:${movieDel.average}");
    setState(() {
      movieDetail = movieDel;
    });
  }
  setData(MovieDetail movieDetail) {
    var movieImage = new Center(
        child: new Image.network(
          movieDetail.smallImage,
          width: 120.0,
          height: 140.0,)
    );

      var movieMsg = new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Text(
          movieDetail.title,
          textAlign: TextAlign.left,
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14.0
          ),
        ),
        new Text('导演：' + movieDetail.director),
        new Text('主演：' + movieDetail.cast),
        new Text(
          movieDetail.collectCount.toString() + '人看过',
          style: new TextStyle(
            fontSize: 12.0,
            color: Colors.redAccent,),
        ),
        new Text('评分：' + movieDetail.average.toString()),
        new Text(
          '剧情简介：' + movieDetail.summary,
          style: new TextStyle(
            fontSize: 12.0,
            color: Colors.black,
          ),
        ),
      ],
    );
    return new Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        left: 10.0,
        right: 10.0,
        bottom: 10.0,
      ),
      child: new Scrollbar(
        child: new Column(
          children: <Widget>[
            movieImage,
            movieMsg,
          ],
        ),
      ),
    );

  }
}
