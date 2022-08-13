import 'package:flutter_base_project/features/data/model/token_entity.dart';
import 'package:flutter_base_project/features/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final 
  @override
  Future<TokenEntity?> getToken() async {
    return null;
  }

  @override
  Future<void> removeToken() async {}

  @override
  Future<void> saveToken(TokenEntity token) async {}

  @override
  Future<TokenEntity?> signIn(String username, String password) async {}
}
