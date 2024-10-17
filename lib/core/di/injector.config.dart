// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/character/detail/data/repository/character_detail_repository_impl.dart'
    as _i11;
import '../../features/character/detail/domain/repository/detail_character_repository.dart'
    as _i4;
import '../../features/character/detail/domain/usecase/detail_character_usecase.dart'
    as _i3;
import '../../features/character/detail/presentation/blocs/detail_character/detail_character_bloc.dart'
    as _i7;
import '../../features/character/home/data/repository/character_repository_impl.dart'
    as _i12;
import '../../features/character/home/domain/repository/character_repository.dart'
    as _i6;
import '../../features/character/home/domain/usecase/character_usecase.dart'
    as _i5;
import '../../features/character/home/presentation/blocs/character_list/character_list_bloc.dart'
    as _i9;
import '../network/config.dart' as _i8;
import '../network/dio_provider.dart' as _i13;

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
  gh.factory<_i3.CharacterDetailUsecase>(
      () => _i3.CharacterDetailUsecase(gh<_i4.CharacterDetailRepository>()));
  gh.factory<_i5.CharacterUseCase>(
      () => _i5.CharacterUseCase(gh<_i6.CharacterRepository>()));
  gh.factory<_i7.DetailCharacterBloc>(
      () => _i7.DetailCharacterBloc(gh<_i3.CharacterDetailUsecase>()));
  gh.factory<_i8.IConfig>(() => _i8.AppConfig());
  gh.factory<_i9.CharacterListBloc>(
      () => _i9.CharacterListBloc(gh<_i5.CharacterUseCase>()));
  gh.singleton<_i10.Dio>(() => dioProvider.dio(gh<_i8.IConfig>()));
  gh.factory<_i4.CharacterDetailRepository>(
      () => _i11.CharacterDetailRepositoryImpl(
            dio: gh<_i10.Dio>(),
            config: gh<_i8.IConfig>(),
          ));
  gh.factory<_i6.CharacterRepository>(() => _i12.CharacterRepositoryImpl(
        dio: gh<_i10.Dio>(),
        config: gh<_i8.IConfig>(),
      ));
  return getIt;
}

class _$DioProvider extends _i13.DioProvider {}
