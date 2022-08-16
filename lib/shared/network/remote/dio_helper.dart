
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: 60 * 1000, // 60 seconds
        receiveTimeout: 60 * 1000));
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        request: true,
        compact: true,
        maxWidth: 600));
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  static Future<Response> getData(
      {required String url,
      String lang = 'en',
      String? token,
      Map<String, dynamic>? query}) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json'
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    String lang = 'en',
    String? token,
    String? key,
    Map<String, dynamic>? query,
    required var data,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': key!+token!,
      'Content-Type': 'application/json'
    };
    return await dio.post(url, data: data);
  }

  static Future<Response> upDateData({
    required String url,
    String lang = 'en',
    String? token,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json'
    };
    return await dio.put(url, data: data);
  }


}
