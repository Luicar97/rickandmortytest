part of 'character_favorite_bloc.dart';

@freezed
class CharacterFavoriteEvent with _$CharacterFavoriteEvent {
  const factory CharacterFavoriteEvent.started() = _Started;
}