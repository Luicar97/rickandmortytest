part of 'character_favorite_bloc.dart';

@freezed
class CharacterFavoriteState with _$CharacterFavoriteState {
  const factory CharacterFavoriteState.inital() = _Initial;

  const factory CharacterFavoriteState.loading() = _Loading;

  const factory CharacterFavoriteState.success() = _Success;

  const factory CharacterFavoriteState.updateFavorite() = _UpdateFavorite;

  const factory CharacterFavoriteState.error(String error) = _Error;
}
