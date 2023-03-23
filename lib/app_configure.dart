import 'package:flutter/services.dart';

abstract class AppConfigure{
  static Map<String,dynamic> _config = {};
  static Future<void> initialize(String env) async{
    final configString =await rootBundle.load('config/app_config_$env.json');
  }
}