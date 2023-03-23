import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

abstract class IConfig {
  String get getEndPoint;

  Map<String, String> get headers;
}

@Injectable(as: IConfig)
class AppConfigure extends IConfig {
  static Map<String, dynamic> _config = {};

  static Future<void> initialize(String env) async {
    final configString =
        await rootBundle.loadString('config/app_config_$env.json');
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  @override
  // TODO: implement getEndPoint
  String get getEndPoint => _config['endPoint'] as String;

  @override
  // TODO: implement headers
  Map<String, String> get headers => {};
}

abstract class Environment {
  static const String dev = "dev";
  static const String staging = "staging";
  static const String prod = "prod";
}
