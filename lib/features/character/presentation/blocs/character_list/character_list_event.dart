part of 'character_list_bloc.dart';

@freezed
class CharacterListEvent with _$CharacterListEvent {
  const factory CharacterListEvent.started() = _Started;
}