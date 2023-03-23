
import '../data/model/response/token_response/token_entity.dart';

abstract class AuthRepository{
  Future<TokenEntity?> getToken();

  Future<void> saveToken(TokenEntity token);

  Future<void> removeToken();

  Future<TokenEntity?> signIn(String username, String password);

}