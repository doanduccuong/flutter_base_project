

import 'package:flutter_base_project/domain/data/model/response/token_response/token_entity.dart';
import 'package:flutter_base_project/domain/repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase({required this.authRepository});

  Future<TokenEntity?> logIn() async {
    return await authRepository.getToken();
  }

  Future<void> removeToken() async {
    return await authRepository.removeToken();
  }

  Future<void> saveToken(TokenEntity token) async {
    return authRepository.saveToken(token);
  }
}
