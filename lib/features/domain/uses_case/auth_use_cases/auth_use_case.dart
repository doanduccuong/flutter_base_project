import 'package:flutter_base_project/features/domain/repositories/auth_repository.dart';

import '../../../data/model/token_entity.dart';

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
