import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_base_project/configs/injection.dart';
import 'package:flutter_base_project/domain/data/model/response/user_response/user_entity.dart';
import 'package:flutter_base_project/domain/repositories/auth_repository.dart';
import '../enum/load_status.dart';
import 'dart:developer' as logger;

part 'app_state.dart';

class AppCubit extends Cubit<AppInitial> {

  AppCubit() : super(const AppInitial());

  void fetchProfile() {
    emit(state.copyWith(fetchProfileStatus: LoadStatus.loading));
  }

  void updateProfile(UserEntity user) {
    emit(state.copyWith(user: user));
  }

  ///Sign Out
  void signOut() async {
    emit(state.copyWith(signOutStatus: LoadStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      await getIt<AuthRepository>().removeToken();
      emit(state.removeUser().copyWith(
            signOutStatus: LoadStatus.success,
          ));
    } catch (e) {
      logger.log(e.toString());
      emit(state.copyWith(signOutStatus: LoadStatus.failure));
    }
  }
}
