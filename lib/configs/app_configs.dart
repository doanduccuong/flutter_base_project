import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'app_envi_config.dart';

class AppConfigs {
  AppConfigs._();

  static const String appName = "Newwave Solution JSC";

  static Environment env = Environment.prod;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  ///API Env
  static String get baseUrl => env.baseUrl;

  static String get envName => env.envName;

  ///Paging
  static const pageSize = 40;
  static const pageSizeMax = 1000;

  ///Local
  static const appLocal = 'vi_VN';
  static const appLanguage = 'vi';
  static const defaultLocal = Locale.fromSubtags(languageCode: appLanguage);

  ///DateFormat

  static const dateAPIFormat = 'dd/MM/yyyy';
  static const dateDisplayFormat = 'dd/MM/yyyy';

  static const dateTimeAPIFormat =
      "MM/dd/yyyy'T'hh:mm:ss.SSSZ"; //Use DateTime.parse(date) instead of ...
  static const dateTimeDisplayFormat = 'dd/MM/yyyy HH:mm';

  ///Date range
  static final identityMinDate = DateTime(1900, 1, 1);
  static final identityMaxDate = DateTime.now();
  static final birthMinDate = DateTime(1900, 1, 1);
  static final birthMaxDate = DateTime.now();

  ///Font
  static const fontFamily = 'Roboto';

  ///Max file
  static const maxAttachFile = 5;
}

class FirebaseConfig {
  //Todo
}

class DatabaseConfig {
  //Todo
  static const int version = 1;
}

class LocationAPIConfig {
  static const String apiKey = '636df07e6e7199992dee41289db80f68';
  static const String apiKey1 = "877fb86140037760886332a3bc66db90";
}

class UpGraderAPIConfig {
  static const String apiKey = '';
}
