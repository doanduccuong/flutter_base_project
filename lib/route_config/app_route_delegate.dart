import 'package:flutter/material.dart';
import 'package:flutter_base_project/features/presentation/page/sign_in_page/sign_in_page.dart';
import 'package:flutter_base_project/route_config/app_route_path.dart';
import 'dart:developer' as logger;
import '../features/presentation/page/unknown_page/unknown_page.dart';

class HomeRouterDelegate extends RouterDelegate<HomeRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<HomeRoutePath> {
  String? pathName;
  bool isError = false;

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  HomeRoutePath get currentConfiguration {
    if (isError) return HomeRoutePath.unKnown();

    if (pathName == null) return HomeRoutePath.home();

    return HomeRoutePath.otherPage(pathName);
  }

  void onTapped(String path) {
    pathName = path;
    logger.log(path);
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        pages: [
          const MaterialPage(
            key: ValueKey('HomePage'),
            child: SignInPage(
                // onTapped: (String path) {
                //   pathName = path;
                //   notifyListeners();
                // },
                ),
          ),
          if (isError)
            const MaterialPage(
              key: ValueKey('UnknownPage'),
              child: UnknownPage(),
            )
          else if (pathName != null)
            MaterialPage(key: ValueKey(pathName), child: const UnknownPage()
                // child: PageHandle(pathName: pathName),
                )
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) return false;
          pathName = null;
          isError = false;
          notifyListeners();
          return true;
        });
  }

  @override
  Future<void> setNewRoutePath(HomeRoutePath homeRoutePath) async {
    if (homeRoutePath.isUnknown) {
      pathName = null;
      isError = true;
      return;
    }

    if (homeRoutePath.isOtherPage) {
      if (homeRoutePath.pathName != null) {
        pathName = homeRoutePath.pathName;
        isError = false;
        return;
      } else {
        isError = true;
        return;
      }
    } else {
      pathName = null;
    }
  }
}
