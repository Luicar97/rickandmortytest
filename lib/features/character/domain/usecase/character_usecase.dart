import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:trumed/core/error/failures.dart';
import 'package:trumed/features/character/domain/entity/character_list_entity.dart';
import 'package:trumed/features/character/domain/repository/character_repository.dart';

@injectable
class CharacterUseCase {
  final CharacterRepository? _characterRepository;

  CharacterUseCase(this._characterRepository);

  Future<Either<Failure, CharacterListEntity?>> execute() async {
    return await _characterRepository!.characterList();
  }
}
