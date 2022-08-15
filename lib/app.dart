import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_project/core/platform/user_rest_client/user_rest_client.dart';
import 'package:flutter_base_project/route_config/app_route_delegate.dart';
import 'package:flutter_base_project/route_config/app_route_information_parser.dart';
import 'package:flutter_base_project/route_config/route_config.dart';
import 'package:flutter_base_project/setting/app_cubit.dart';
import 'package:flutter_base_project/setting/app_setting/app_setting_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/presentation/page/splash_page/splash_page.dart';
import 'generated/l10n.dart';
import 'router/router.dart' as router;
import 'configs/app_configs.dart';
import 'configs/app_themes.dart';
import 'core/platform/network/network_info.dart';
import 'features/data/repositories/autho_repository_impl.dart';
import 'features/data/repositories/user_repository_impl.dart';
import 'features/domain/repositories/auth_repository.dart';
import 'features/domain/repositories/use_repository.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  late UserRestClient _userRestClient;

  @override
  void initState() {
    _userRestClient = ApiUtil.apiClient;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Setup PortraitUp only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(create: (context) {
          return AuthRepositoryImpl(userRestClient: _userRestClient);
        }),
        RepositoryProvider<UserRepository>(create: (context) {
          return UserRepositoryImpl(userRestClient: _userRestClient);
        }),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(create: (context) {
            final userRepo = RepositoryProvider.of<UserRepository>(context);
            final authRepo = RepositoryProvider.of<AuthRepository>(context);
            return AppCubit(
              userRepo: userRepo,
              authRepo: authRepo,
            );
          }),
          BlocProvider<AppSettingCubit>(create: (context) {
            return AppSettingCubit();
          }),
        ],
        child: BlocBuilder<AppSettingCubit, AppSettingState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                _hideKeyboard(context);
              },
              child: MaterialApp.router(
                title: AppConfigs.appName,
                // home: const SplashPage(),
                theme: AppThemes(
                  isDarkMode: false,
                  primaryColor: state.primaryColor,
                ).theme,
                darkTheme: AppThemes(
                  isDarkMode: true,
                  primaryColor: state.primaryColor,
                ).theme,
                // navigatorKey: AppConfigs.navigatorKey,
                // initialRoute: RouteConfig.homePage,
                // onGenerateRoute: router.generateRoute,
                themeMode: state.themeMode,

                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  S.delegate,
                ],
                locale: state.locale,
                supportedLocales: S.delegate.supportedLocales,
                routerDelegate: HomeRouterDelegate(),
                routeInformationParser: HomeRouteInformationParser(),
              ),
            );
          },
        ),
      ),
    );
  }

  void _hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
