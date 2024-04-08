// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    // BaseOptions baseOptions = BaseOptions(
    //   baseUrl: "http://www.ma511.somee.com/api/",
    //   receiveDataWhenStatusError: true,
    // );
    // dio = Dio(baseOptions);
    // dio.interceptors.add(LogInterceptor(
    //   requestBody: true,
    //   responseBody: true,
    //   request: true,
    //   requestHeader: true,
    //   responseHeader: true,
    //   error: true,
    //   logPrint: print,
    // ));
    dio = Dio(
      BaseOptions(
        baseUrl: "https://alojaimi.sds.sa/INV/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? qury,
    String lang = 'en',
    String? token,
    Map<String, String>? data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio.get(
      url,
      queryParameters: qury,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? qury,
 
   
  }) async {
    dio.options.headers = {
      "x-api-key":"AAAAuhxRITI:APA91bHEZdFgYXEMCtj36-L--KdHld-V7Mj2nJY3XN9vJcQvzaNXCKddsy8f5-aQBrrJh9MsEeA0kLmWTnlpoG1xKRjF2Jrg1PevXO1cSBG-cFORr55HlFgPxQ_JpToXsA_sFKa51EXE" ,
      'Content-Type': 'application/json',
      'Authorization': "Basic Og==",
    };
    return await dio.post(
      url,
      data: data,
      queryParameters: qury,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? qury,
    String lang = 'en',
    String? token,
    Map<String, String>? data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio.put(
      url,
      data: data,
      queryParameters: qury,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? qury,
    String lang = 'en',
    String? token,
    Map<String, String>? data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio.delete(
      url,
      data: data,
      queryParameters: qury,
    );
  }
}