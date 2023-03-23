import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_project/application/app_setting/app_setting_cubit.dart';
import 'package:flutter_base_project/route_config/route_config.dart';
import 'package:flutter_base_project/application/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'generated/l10n.dart';
import 'route_config/router.dart' as router;
import 'configs/app_configs.dart';
import 'configs/app_themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (context) {
          return AppCubit();
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
            child: MaterialApp(
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
              navigatorKey: AppConfigs.navigatorKey,
              initialRoute: RouteConfig.homePage,
              onGenerateRoute: router.generateRoute,
              themeMode: state.themeMode,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                S.delegate,
              ],
              locale: state.locale,
              supportedLocales: S.delegate.supportedLocales,
            ),
          );
        },
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
