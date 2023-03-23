import 'package:injectable/injectable.dart';

import '../../repositories/use_repository.dart';
import '../model/response/user_response/user_entity.dart';
@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {


  @override
  Future<void> fetchProfile() async {}

  @override
  Future<UserEntity?> getProfile() async {}
}
