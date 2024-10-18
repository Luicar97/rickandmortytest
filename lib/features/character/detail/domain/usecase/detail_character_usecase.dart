import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:trumed/core/error/failures.dart';
import 'package:trumed/features/character/detail/domain/entity/character_detail_entity.dart';
import 'package:trumed/features/character/detail/domain/entity/epidode_detail_entity.dart';
import 'package:trumed/features/character/detail/domain/repository/detail_character_repository.dart';

@injectable
class CharacterDetailUsecase {
  final CharacterDetailRepository? _characterDetailRepository;

  CharacterDetailUsecase(this._characterDetailRepository);

  Future<Either<Failure, CharacterDetailEntity?>> characterDetail(
      {required int id}) async {
    return await _characterDetailRepository!.characterDetail(id: id);
  }

  Future<Either<Failure, List<EpisodeDetailEntity>?>> episodeDetail(
      {required String idEpisodes}) async {
    return await _characterDetailRepository!
        .episodeDetail(idEpisodes: idEpisodes);
  }
}
