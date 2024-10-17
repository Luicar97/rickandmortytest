import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:trumed/features/character/domain/usecase/character_usecase.dart';

part 'character_list_event.dart';
part 'character_list_state.dart';
part 'character_list_bloc.freezed.dart';

@injectable
class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  CharacterListBloc(this.characterUserUseCase)
      : super(const CharacterListState.inital()) {
    on<_Started>(_started);
  }

  final CharacterUseCase characterUserUseCase;

  FutureOr<void> _started(
      _Started event, Emitter<CharacterListState> emit) async {
    emit(const CharacterListState.loading());

    final response = await characterUserUseCase.execute();

    response.fold((l) {
      return null;
    }, (r) {
      print(r);
      print(r!.results);
      // if (r!.length == -1) {
      //   // the most safe way to check for error eva
      //   emit(LoginState.error(r.fact));
      // } else {
      //   emit(LoginState.funFact(r));
      // }
    });

    print('asdsadsadsad');
    return null;
  }
}
