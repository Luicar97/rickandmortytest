// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/character/detail/data/repository/character_detail_repository_impl.dart'
    as _i12;
import '../../features/character/detail/domain/repository/detail_character_repository.dart'
    as _i4;
import '../../features/character/detail/domain/usecase/detail_character_usecase.dart'
    as _i3;
import '../../features/character/detail/presentation/blocs/detail_character/detail_character_bloc.dart'
    as _i8;
import '../../features/character/favorite/presentation/blocs/character_favorite/character_favorite_bloc.dart'
    as _i5;
import '../../features/character/home/data/repository/character_repository_impl.dart'
    as _i13;
import '../../features/character/home/domain/repository/character_repository.dart'
    as _i7;
import '../../features/character/home/domain/usecase/character_usecase.dart'
    as _i6;
import '../../features/character/home/presentation/blocs/character_list/character_list_bloc.dart'
    as _i10;
import '../network/config.dart' as _i9;
import '../network/dio_provider.dart' as _i14;

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
  gh.factory<_i5.CharacterFavoriteBloc>(() => _i5.CharacterFavoriteBloc());
  gh.factory<_i6.CharacterUseCase>(
      () => _i6.CharacterUseCase(gh<_i7.CharacterRepository>()));
  gh.factory<_i8.DetailCharacterBloc>(
      () => _i8.DetailCharacterBloc(gh<_i3.CharacterDetailUsecase>()));
  gh.factory<_i9.IConfig>(() => _i9.AppConfig());
  gh.factory<_i10.CharacterListBloc>(
      () => _i10.CharacterListBloc(gh<_i6.CharacterUseCase>()));
  gh.singleton<_i11.Dio>(() => dioProvider.dio(gh<_i9.IConfig>()));
  gh.factory<_i4.CharacterDetailRepository>(
      () => _i12.CharacterDetailRepositoryImpl(
            dio: gh<_i11.Dio>(),
            config: gh<_i9.IConfig>(),
          ));
  gh.factory<_i7.CharacterRepository>(() => _i13.CharacterRepositoryImpl(
        dio: gh<_i11.Dio>(),
        config: gh<_i9.IConfig>(),
      ));
  return getIt;
}

class _$DioProvider extends _i14.DioProvider {}
