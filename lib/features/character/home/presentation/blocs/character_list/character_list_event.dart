part of 'character_list_bloc.dart';

@freezed
class CharacterListEvent with _$CharacterListEvent {
  const factory CharacterListEvent.started() = _Started;
  const factory CharacterListEvent.changePage(int page) = _ChangePage;
  const factory CharacterListEvent.changePageApi(int page, String search) =
      _ChangePageApi;
  const factory CharacterListEvent.searchCharacter(String search) =
      _SearchCharacter;
}
