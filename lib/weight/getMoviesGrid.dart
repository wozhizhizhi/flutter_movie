import 'package:flutter/material.dart';
import 'package:flutter_animation/modles/Movie.dart';
import 'package:flutter_animation/weight/Photo.dart';
import 'package:flutter_animation/views/MovieDelPage.dart';

Widget getMoviesGrid(
    {List<Movie> movies,
    BuildContext context,
    int crossAxisCount,
    Axis scroll = Axis.vertical}) {
  if (movies.length == 0) {
    return new Container(
      child: new Center(
        child: new Text('没有电影数据'),
      ),
    );
  }
  return new GridView.count(
      crossAxisCount: crossAxisCount,
      scrollDirection: scroll,
      mainAxisSpacing: 2.0,
      crossAxisSpacing: 2.0,
      padding: const EdgeInsets.all(4.0),
      children: movies
          .map((movie) => new Card(
                child: new GridTile(
                  child: new PhotoHero(photo: movie.small, onTap: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context){
                      return new MovieDelPage();
                    }));
                  }),
                  footer: new GridTileBar(
                      backgroundColor: Colors.black45,
                      title: new FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: new Text(movie.title),
                      )),
                ),
              ))
          .toList());
}
