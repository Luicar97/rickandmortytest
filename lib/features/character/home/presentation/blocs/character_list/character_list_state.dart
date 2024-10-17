part of 'character_list_bloc.dart';

@freezed
class CharacterListState with _$CharacterListState {
  const factory CharacterListState.inital() = _Initial;

  const factory CharacterListState.loading() = _Loading;

  const factory CharacterListState.success(CharacterListEntity characterList) =
      _Success;

  const factory CharacterListState.error(String error) = _Error;
}
