import 'package:equatable/equatable.dart';
import 'package:flutter_base_project/configs/injection.dart';
import 'package:flutter_base_project/domain/repositories/auth_repository.dart';
import 'package:flutter_base_project/domain/repositories/use_repository.dart';
import 'dart:developer' as logger;
import 'package:flutter_base_project/application/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../configs/app_configs.dart';
import '../../../../../enum/load_status.dart';
import '../../../../../route_config/route_config.dart';
import '../../../../../component/app_snack_bar.dart';
import '../../../../domain/data/model/response/user_response/user_entity.dart';


part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AppCubit appCubit;

  SignInCubit({
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
      final result = await getIt<AuthRepository>().signIn(username, password);
      if (result != null) {
        UserEntity? myProfile = await getIt<UserRepository>().getProfile();
        appCubit.updateProfile(myProfile ?? const UserEntity());
        getIt<AuthRepository>().saveToken(result);
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
