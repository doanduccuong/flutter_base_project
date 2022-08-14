import 'package:flutter_base_project/core/platform/user_rest_client/user_rest_client.dart';
import 'package:flutter_base_project/features/data/data_source/local_storage.dart';
import 'package:flutter_base_project/features/data/model/response/token_response/token_entity.dart';
import 'package:flutter_base_project/features/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserRestClient userRestClient;

  AuthRepositoryImpl({
    required this.userRestClient,
  });

  @override
  Future<TokenEntity?> getToken() async {
    return null;
  }

  @override
  Future<void> removeToken() async {
    LocalStorage.removeApiTokenKey();
  }

  @override
  Future<void> saveToken(TokenEntity token) async {
    LocalStorage.saveToken(token.accessToken ?? "");
  }

  @override
  Future<TokenEntity?> signIn(String username, String password) async {
    //Todo
    await Future.delayed(const Duration(seconds: 2));
    return const TokenEntity(
      accessToken: 'app_access_token',
      refreshToken: 'app_refresh_token',
    );
  }
}
