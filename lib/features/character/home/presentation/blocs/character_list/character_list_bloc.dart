import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:trumed/features/character/home/domain/entity/character_list_entity.dart';
import 'package:trumed/features/character/home/domain/usecase/character_usecase.dart';

part 'character_list_event.dart';
part 'character_list_state.dart';
part 'character_list_bloc.freezed.dart';

@injectable
class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  CharacterListBloc(this.characterUserUseCase)
      : super(const CharacterListState.inital()) {
    on<_Started>(_started);
    on<_ChangePage>(_changePage);
    on<_ChangePageApi>(_changePageApi);
    on<_SearchCharacter>(_searchCharacter);
  }

  final CharacterUseCase characterUserUseCase;

  int page = 0;
  CharacterListEntity? characterListEntity;
  String name = '';

  FutureOr<void> _started(
      _Started event, Emitter<CharacterListState> emit) async {
    emit(const CharacterListState.loading());
    final response = await characterUserUseCase.execute();
    response.fold((l) {
      emit(const CharacterListState.error(''));
    }, (r) {
      characterListEntity = r;
      emit(CharacterListState.success(r!));
    });
  }

  FutureOr<void> _changePage(
      _ChangePage event, Emitter<CharacterListState> emit) async {
    emit(const CharacterListState.loading());
    page = event.page;
    emit(CharacterListState.success(characterListEntity!));
  }

  FutureOr<void> _changePageApi(
      _ChangePageApi event, Emitter<CharacterListState> emit) async {
    emit(const CharacterListState.loading());

    final response = await characterUserUseCase.changePage(
      params: {'page': event.page, 'name': name},
    );

    response.fold((l) {
      emit(const CharacterListState.error(''));
    }, (r) {
      characterListEntity = r;

      emit(CharacterListState.success(r!));
    });
  }

  FutureOr<void> _searchCharacter(
      _SearchCharacter event, Emitter<CharacterListState> emit) async {
    emit(const CharacterListState.loading());

    final response = await characterUserUseCase.changePage(
      params: {'page': page, 'name': event.search},
    );

    response.fold((l) {
      emit(const CharacterListState.error(''));
    }, (r) {
      name = event.search;
      characterListEntity = r;
      page = 0;

      emit(CharacterListState.success(r!));
    });
  }
}
