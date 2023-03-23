import 'package:flutter/material.dart';
import 'package:flutter_base_project/route_config/route_config.dart';
import '../presentation/page/sign_in_page/sign_in_page.dart';


Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteConfig.signInPage:
      return MaterialPageRoute(builder: (_) =>  const SignInPage(),settings: settings);
    case RouteConfig.homePage:
      return MaterialPageRoute(builder: (_) =>  const SignInPage(),settings: settings);
    default:
      return MaterialPageRoute(
          builder: (_) => Container(
            alignment: Alignment.center,
            child:  Text("Undefined page route ${settings.name}"),
          ));
  }
}