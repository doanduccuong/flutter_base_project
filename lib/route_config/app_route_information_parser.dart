import 'package:flutter/material.dart';
import 'package:flutter_base_project/route_config/app_route_path.dart';

class HomeRouteInformationParser extends RouteInformationParser<HomeRoutePath> {
  @override
  Future<HomeRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? "");

    if (uri.pathSegments.isEmpty) {
      return HomeRoutePath.home();
    }

    if (uri.pathSegments.length == 1) {
      final pathName = uri.pathSegments.elementAt(0).toString();
      if (pathName == null) return HomeRoutePath.unKnown();
      return HomeRoutePath.otherPage(pathName);
    }

    return HomeRoutePath.unKnown();
  }

  @override
  RouteInformation restoreRouteInformation(HomeRoutePath homeRoutePath) {
    if (homeRoutePath.isUnknown) {
      return const RouteInformation(location: '/error');
    } else if (homeRoutePath.isHomePage) {
      return const RouteInformation(location: '/');
    } else {
      return RouteInformation(location: '/${homeRoutePath.pathName}');
    }
  }
}
