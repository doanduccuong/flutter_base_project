import 'package:dio/dio.dart';
import 'package:flutter_base_project/core/platform/user_rest_client/user_rest_client.dart';

import '../../../configs/app_configs.dart';
import 'interceptor.dart';

class ApiUtil {
  static Dio? dio;

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio!.options.connectTimeout = 60000;
      dio!.interceptors.add(ApiInterceptors());
    }
    return dio!;
  }

  static UserRestClient get apiClient {
    final apiClient = UserRestClient(getDio(), baseUrl: AppConfigs.baseUrl);
    return apiClient;
  }
}
