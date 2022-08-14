import 'package:flutter_base_project/core/platform/user_rest_client/user_rest_client.dart';
import 'package:flutter_base_project/features/data/model/response/user_response/user_entity.dart';
import 'package:flutter_base_project/features/domain/repositories/use_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRestClient userRestClient;

  UserRepositoryImpl({required this.userRestClient});

  @override
  Future<void> fetchProfile() async {}

  @override
  Future<UserEntity?> getProfile() async {}
}
