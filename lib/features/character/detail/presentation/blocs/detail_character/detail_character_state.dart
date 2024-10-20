part of 'detail_character_bloc.dart';

@freezed
class DetailCharacterState with _$DetailCharacterState {
  const factory DetailCharacterState.inital() = _Initial;

  const factory DetailCharacterState.loading() = _Loading;

  const factory DetailCharacterState.success(
      CharacterDetailEntity character,
      List<EpisodeDetailEntity>? listEpisodes,
      FavoriteDatabaseEntity? favoriteDatabaseEntity) = _Success;

  const factory DetailCharacterState.error(String error) = _Error;
}
