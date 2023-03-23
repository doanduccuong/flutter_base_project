
import 'package:flutter_base_project/domain/data/model/response/user_response/user_entity.dart';

abstract class UserRepository{
  Future<void> fetchProfile();
  Future<UserEntity?> getProfile();
}