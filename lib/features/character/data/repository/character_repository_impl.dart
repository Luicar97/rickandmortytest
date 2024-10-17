import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:trumed/core/error/failures.dart';
import 'package:trumed/core/network/config.dart';
import 'package:trumed/core/repository/chooser.dart';
import 'package:trumed/features/character/data/datasource/character_datasource.dart';
import 'package:trumed/features/character/data/models/character_list_model.dart';
import 'package:trumed/features/character/domain/entity/character_list_entity.dart';
import 'package:trumed/features/character/domain/repository/character_repository.dart';

@Injectable(as: CharacterRepository)
class CharacterRepositoryImpl implements CharacterRepository {
  final Dio dio;
  final IConfig config;
  // final NetworkInfo networkInfo;
  final CharacterRemoteDataSource characterRemoteDataSource;

  CharacterRepositoryImpl({
    required this.dio,
    required this.config,
    // required this.networkInfo,
  }) : characterRemoteDataSource =
            CharacterRemoteDataSource(dio, config.baseUrl);

  @override
  Future<Either<Failure, CharacterListEntity?>> characterList() {
    return _characterListOrFail(
      () => characterRemoteDataSource.characterList(),
    );
  }

  Future<Either<Failure, CharacterListEntity?>> _characterListOrFail(
    Chooser getChooser,
  ) async {
    try {
      final remote = await getChooser() as CharacterListModel;

      return Right(toEntityCharacterListModel(remote));
    } on Exception {
      return Left(GeneralFailure());
    }
  }
}
