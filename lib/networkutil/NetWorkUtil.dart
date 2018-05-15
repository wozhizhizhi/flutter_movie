import 'package:http/http.dart'as http;
import 'dart:async';
import 'dart:convert';
class NetWorkUtil
{
  final JsonDecoder jsonDecoder = new JsonDecoder();

  Future<dynamic> getRequest(String url) {
     return http.get(url).then((http.Response response){
       final String res = response.body;
       final statuscode = response.statusCode;
       if (statuscode < 200 || statuscode > 400 || json == null){
            new Exception('Error while fetching data');
       }
       return jsonDecoder.convert(res);
     });
  }
}