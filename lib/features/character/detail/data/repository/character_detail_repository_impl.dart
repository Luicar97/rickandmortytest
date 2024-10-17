import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:trumed/core/error/failures.dart';
import 'package:trumed/core/network/config.dart';
import 'package:trumed/core/repository/chooser.dart';
import 'package:trumed/features/character/detail/data/datasource/character_detail_datasouce.dart';
import 'package:trumed/features/character/detail/data/models/character_detail_model.dart';
import 'package:trumed/features/character/detail/domain/entity/character_detail_entity.dart';
import 'package:trumed/features/character/detail/domain/repository/detail_character_repository.dart';
import 'package:trumed/features/character/home/data/datasource/character_datasource.dart';
import 'package:trumed/features/character/home/data/models/character_list_model.dart';
import 'package:trumed/features/character/home/domain/entity/character_list_entity.dart';
import 'package:trumed/features/character/home/domain/repository/character_repository.dart';

@Injectable(as: CharacterDetailRepository)
class CharacterDetailRepositoryImpl implements CharacterDetailRepository {
  final Dio dio;
  final IConfig config;
  // final NetworkInfo networkInfo;
  final CharacterDetailRemoteDataSource characterDetailRemoteDataSource;

  CharacterDetailRepositoryImpl({
    required this.dio,
    required this.config,
    // required this.networkInfo,
  }) : characterDetailRemoteDataSource =
            CharacterDetailRemoteDataSource(dio, config.baseUrl);

  @override
  Future<Either<Failure, CharacterDetailEntity?>> characterDetail(
      {required int id}) {
    return _characterDetailOrFail(
      () => characterDetailRemoteDataSource.characterDetail(id: id),
    );
  }

  Future<Either<Failure, CharacterDetailEntity?>> _characterDetailOrFail(
    Chooser getChooser,
  ) async {
    try {
      final remote = await getChooser() as CharacterDetailModel;

      return Right(toEntityCharacterDetailModel(remote));
    } on Exception {
      return Left(GeneralFailure());
    }
  }
}
