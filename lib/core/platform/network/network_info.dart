import 'package:dio/dio.dart';
import 'package:flutter_base_project/app_configure.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioProvider {
  @singleton
  Dio dio(IConfig config) {
    Dio dio = Dio();
    dio.options.headers = config.headers;
    return dio;
  }
}
