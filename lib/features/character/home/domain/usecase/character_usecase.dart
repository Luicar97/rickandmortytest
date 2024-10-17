import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:trumed/core/error/failures.dart';
import 'package:trumed/features/character/home/domain/entity/character_list_entity.dart';
import 'package:trumed/features/character/home/domain/repository/character_repository.dart';

@injectable
class CharacterUseCase {
  final CharacterRepository? _characterRepository;

  CharacterUseCase(this._characterRepository);

  Future<Either<Failure, CharacterListEntity?>> execute() async {
    return await _characterRepository!.characterList();
  }

  Future<Either<Failure, CharacterListEntity?>> changePage(
      {Map<String, dynamic>? params}) async {
    return await _characterRepository!.changePage(params: params);
  }
}
