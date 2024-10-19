part of 'character_favorite_bloc.dart';

@freezed
class CharacterFavoriteEvent with _$CharacterFavoriteEvent {
  const factory CharacterFavoriteEvent.listFavorite() = _ListFavorite;
  const factory CharacterFavoriteEvent.deleteFavorite(int characterId) =
      _DeleteFavorite;
}
