import 'package:dio/dio.dart';

class DioRequest {
  static BaseOptions options = new BaseOptions(
      //baseUrl: "http://192.168.1.6:8000/api/",
      baseUrl: "https://admin.deraya.net/api/",
      connectTimeout: 30000,
      receiveTimeout: 3000,
      followRedirects: false,
      validateStatus: (status) {
        return status <= 500;
      },
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      });
}