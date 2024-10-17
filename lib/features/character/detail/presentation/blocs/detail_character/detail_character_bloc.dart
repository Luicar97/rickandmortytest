import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:trumed/features/character/detail/domain/usecase/detail_character_usecase.dart';

part 'detail_character_event.dart';
part 'detail_character_state.dart';
part 'detail_character_bloc.freezed.dart';

@injectable
class DetailCharacterBloc
    extends Bloc<DetailCharacterEvent, DetailCharacterState> {
  DetailCharacterBloc(this.characterDetailUsecase)
      : super(const DetailCharacterState.inital()) {
    on<_DetailCharacter>(_detailCharacter);
  }

  CharacterDetailUsecase characterDetailUsecase;

  FutureOr<void> _detailCharacter(
      _DetailCharacter event, Emitter<DetailCharacterState> emit) async {
    emit(const DetailCharacterState.loading());

    final response = await characterDetailUsecase.characterDetail(id: 2);

    response.fold((l) {
      emit(const DetailCharacterState.error(''));
    }, (r) {
      print('RESULT');
      print(r);

      // emit(DetailCharacterState.success(r!));
    });
  }
}
