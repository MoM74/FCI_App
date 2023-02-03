import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static late Dio dio;

  static init()
  {
    dio = Dio(

      BaseOptions(
        baseUrl: 'https://uni-platform.herokuapp.com/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
     required String url,
     Map<String, dynamic>? query,
     String? token,
  }) async
  {
    dio.options.headers =
    {
      'Authorization': 'token $token' ,
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'Authorization': token ,
    };

    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> postsData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'Authorization': 'token $token' ,
    };

    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'Authorization':'token $token' ,
    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'Authorization': 'token $token' ,
    };

    return await dio.delete(
      url,
      queryParameters: query,
    );
  }

}
