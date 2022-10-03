import 'package:dio/dio.dart';

class DioClient {
  static const baseurl = 'https://foodiescalender-backend.herokuapp.com/';
  static BaseOptions options = BaseOptions(baseUrl: baseurl);

  static Future<Dio> provideDio() async {
    final Dio dio = Dio(options);
    return dio;
  }
}
