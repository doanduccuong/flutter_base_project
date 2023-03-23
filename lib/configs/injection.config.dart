// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app_configure.dart' as _i5;
import '../core/platform/network/network_info.dart' as _i9;
import '../domain/data/repositories/autho_repository_impl.dart' as _i4;
import '../domain/data/repositories/user_repository_impl.dart' as _i7;
import '../domain/repositories/auth_repository.dart' as _i3;
import '../domain/repositories/use_repository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioProvider = _$DioProvider();
  gh.factory<_i3.AuthRepository>(() => _i4.AuthRepositoryImpl());
  gh.factory<_i5.IConfig>(() => _i5.AppConfigure());
  gh.factory<_i6.UserRepository>(() => _i7.UserRepositoryImpl());
  gh.singleton<_i8.Dio>(dioProvider.dio(get<_i5.IConfig>()));
  return get;
}

class _$DioProvider extends _i9.DioProvider {}
