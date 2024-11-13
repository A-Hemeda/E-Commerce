//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
//https://newsapi.org/
//v2/top-headlines?country=eg&apiKey=API_KEY

import 'package:dio/dio.dart';

class DioHelper {

  static late Dio dio;

  static init(){
    dio =Dio(
      BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true ,

          ),
      );
  }
  static Future<Response> getData({
    required String url,
    Map<String , dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers =
    {
      'lang':lang,
      'authorization': token??'',
      'Content-Type' : 'application/json',
    };
    return await dio.get(url,queryParameters: query);
  }

  static Future<Response> postData({
        required String url,
        required Map<String , dynamic> data,
        String lang = 'ar',
        String token = '',
      }
  ) async {
    dio.options.headers =
    {
      'lang':lang,
      'authorization': token,
    };
    return dio.post(
        url,
        data: data,
    );
  }

}