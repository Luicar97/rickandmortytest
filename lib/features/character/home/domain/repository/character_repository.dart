import 'package:dartz/dartz.dart';
import 'package:trumed/core/error/failures.dart';
import 'package:trumed/features/character/home/domain/entity/character_list_entity.dart';

abstract class CharacterRepository {
  Future<Either<Failure, CharacterListEntity?>> characterList();
  Future<Either<Failure, CharacterListEntity?>> changePage(
      {Map<String, dynamic>? params});
}
