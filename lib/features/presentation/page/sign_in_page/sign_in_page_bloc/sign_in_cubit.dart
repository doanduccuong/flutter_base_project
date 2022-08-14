import 'package:equatable/equatable.dart';
import 'dart:developer' as logger;
import 'package:flutter_base_project/setting/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../configs/app_configs.dart';
import '../../../../../enum/load_status.dart';
import '../../../../../route_config/route_config.dart';
import '../../../../../widget/app_snack_bar.dart';
import '../../../../data/model/response/user_response/user_entity.dart';
import '../../../../domain/repositories/auth_repository.dart';
import '../../../../domain/repositories/use_repository.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  final AppCubit appCubit;

  SignInCubit({
    required this.authRepository,
    required this.userRepository,
    required this.appCubit,
  }) : super(const SignInState());

  void changeUsername({required String username}) {
    emit(state.copyWith(username: username));
  }

  void changePassword({required String password}) {
    emit(state.copyWith(password: password));
  }

  void signIn() async {
    final username = state.username ?? '';
    final password = state.password ?? '';
    if (username.isEmpty) {
      AppSnackbar.showError(message: 'Username is empty');
      return;
    }
    if (password.isEmpty) {
      AppSnackbar.showError(message: 'Password is empty');
      return;
    }
    emit(state.copyWith(signInStatus: LoadStatus.loading));
    try {
      final result = await authRepository.signIn(username, password);
      if (result != null) {
        UserEntity? myProfile = await userRepository.getProfile();
        appCubit.updateProfile(myProfile ?? const UserEntity());
        authRepository.saveToken(result);
        emit(state.copyWith(signInStatus: LoadStatus.success));
        AppConfigs.navigatorKey.currentState?.pushNamed(RouteConfig.mainPage);
      } else {
        emit(state.copyWith(signInStatus: LoadStatus.failure));
      }
    } catch (error) {
      logger.log(error.toString());
      emit(state.copyWith(signInStatus: LoadStatus.failure));
    }
  }
}
