// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/character/data/repository/character_repository_impl.dart'
    as _i8;
import '../../features/character/domain/repository/character_repository.dart'
    as _i4;
import '../../features/character/domain/usecase/character_usecase.dart' as _i3;
import '../../features/character/presentation/blocs/character_list/character_list_bloc.dart'
    as _i6;
import '../network/config.dart' as _i5;
import '../network/dio_provider.dart' as _i9;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioProvider = _$DioProvider();
  gh.factory<_i3.CharacterUseCase>(
      () => _i3.CharacterUseCase(gh<_i4.CharacterRepository>()));
  gh.factory<_i5.IConfig>(() => _i5.AppConfig());
  gh.factory<_i6.CharacterListBloc>(
      () => _i6.CharacterListBloc(gh<_i3.CharacterUseCase>()));
  gh.singleton<_i7.Dio>(() => dioProvider.dio(gh<_i5.IConfig>()));
  gh.factory<_i4.CharacterRepository>(() => _i8.CharacterRepositoryImpl(
        dio: gh<_i7.Dio>(),
        config: gh<_i5.IConfig>(),
      ));
  return getIt;
}

class _$DioProvider extends _i9.DioProvider {}
