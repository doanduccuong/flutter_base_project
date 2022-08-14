import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_base_project/configs/app_configs.dart';
import 'package:flutter_base_project/features/domain/repositories/auth_repository.dart';
import 'package:flutter_base_project/features/domain/repositories/use_repository.dart';
import 'package:flutter_base_project/route_config/route_config.dart';
import 'package:meta/meta.dart';
import 'dart:developer' as logger;
import '../../../../../widget/app_dialog.dart';

part 'splash_page_state.dart';

class SplashPageCubit extends Cubit<SplashPageState> {
  SplashPageCubit({
    required this.userRepository,
    required this.authRepository,
  }) : super(SplashPageInitial());
  final AuthRepository authRepository;
  final UserRepository userRepository;

  void checkLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    final token = await authRepository.getToken();
    if (token == null) {
      AppConfigs.navigatorKey.currentState?.pushNamed(RouteConfig.signInPage);
      // Get.offAll(() => const SignInPage());
    } else {
      try {
        // await _determinePosition();
        //Profile
        await userRepository.getProfile();
        //Todo
        // authService.updateUser(myProfile);
      } catch (error, s) {
        logger.log(error.toString(), stackTrace: s);
        //Check 401
        if (error is DioError) {
          if (error.response?.statusCode == 401) {
            //Todo
            // authService.signOut();
            checkLogin();
            return;
          }
        }
        AppDialog.defaultDialog(
          message: "An error happened. Please check your connection!",
          textConfirm: "Retry",
          onConfirm: () {
            checkLogin();
          },
        );
        return;
      }
      //TODO navigate to main page
      // Get.offAll(() => const MainPage());
    }
  }
}
