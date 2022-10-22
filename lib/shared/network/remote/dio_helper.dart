//bb505f67c887401c897ba16a3675d404
import 'package:dio/dio.dart';

 class DioHelper
{
  static late Dio dio;
  static init(){
    dio =Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true
      )
    );
    }
  static Future<Response> getData ({required String urlPath,required Map<String ,dynamic> query})async {
    return await dio.get(urlPath, queryParameters: query,);
  }
}