import 'dart:async';
import 'package:flutter_animation/networkutil/NetWorkUtil.dart';
import 'package:flutter_animation/modles/Movie.dart';
class NetWorkData
{
  NetWorkUtil netWorkUtil;
  final String APPKEY = '0b2bdeda43b5688921839c8ecb20399b';
  final String _url = 'https://api.douban.com/v2/movie/in_theaters?';

  NetWorkData()
  {
    netWorkUtil = new NetWorkUtil();
  }

  Future<List<Movie>> getPopulaMovie()=>
    netWorkUtil.getRequest('${_url}apikey=$APPKEY&city=%E5%8C%97%E4%BA%AC&'
        'start=0&count=100&client=&udid=').then((dynamic res){
        List data = res['subjects'];
        return data.map((obj) => new Movie().fromMap(obj)).toList();
    });

}