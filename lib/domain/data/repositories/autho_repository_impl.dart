import 'package:flutter_base_project/domain/data/data_source/local_storage.dart';
import 'package:flutter_base_project/domain/data/model/response/token_response/token_entity.dart';
import 'package:flutter_base_project/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {

  AuthRepositoryImpl();

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
