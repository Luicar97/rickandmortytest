import 'package:dartz/dartz.dart';
import 'package:trumed/core/error/failures.dart';
import 'package:trumed/features/character/detail/domain/entity/character_detail_entity.dart';
import 'package:trumed/features/character/detail/domain/entity/epidode_detail_entity.dart';

abstract class CharacterDetailRepository {
  Future<Either<Failure, CharacterDetailEntity?>> characterDetail({
    required int id,
  });

  Future<Either<Failure, List<EpisodeDetailEntity>?>> episodeDetail({
    required String idEpisodes,
  });
}
