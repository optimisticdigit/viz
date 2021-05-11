import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiRequest {
  final String url;
  final Map data;

  ApiRequest({@required this.url, this.data });

  Dio _dio(){
    return Dio(BaseOptions(headers: {
      'Autorization':'Bearer OANDA-AUTHENTICATION_TOKEN',

        },
        followRedirects: false,
        validateStatus: (status) {
          return status <= 500;
        }));
  }
  Future<dynamic> get() async{
    try{
      final responce = await _dio().get(this.url, queryParameters: this.data);
    } catch(error, stacktrace){
      print('Exception occured: $error with stacktrace: $stacktrace');
      throw Exception('Exception occured: $error with stacktrace: $stacktrace');
    }

  }
}