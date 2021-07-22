import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper{
  static Dio? dio;
  static void init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({required String url,required Map<String,dynamic>query}) async{
    return await dio!.get(url,queryParameters: query);
  }

}