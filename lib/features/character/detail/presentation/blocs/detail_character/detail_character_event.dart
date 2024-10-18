part of 'detail_character_bloc.dart';

@freezed
class DetailCharacterEvent with _$DetailCharacterEvent {
  const factory DetailCharacterEvent.detailCharacter(int id) = _DetailCharacter;
  const factory DetailCharacterEvent.addFavorite(
      int id, String name, String image) = _AddFavorite;
}
