import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:trumed/features/character/detail/domain/entity/character_detail_entity.dart';
import 'package:trumed/features/character/detail/domain/entity/epidode_detail_entity.dart';
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
    List<String> idEpisodes = [];
    CharacterDetailEntity? characterDetailEntity;

    emit(const DetailCharacterState.loading());

    final response = await characterDetailUsecase.characterDetail(id: event.id);

    response.fold((l) {
      emit(const DetailCharacterState.error(''));
    }, (r) {
      for (var i = 0; i < r!.episode.length; i++) {
        var arrUrl = r.episode[i].split('/');
        idEpisodes.add(arrUrl.last);
      }

      characterDetailEntity = r;
    });

    if (idEpisodes.isNotEmpty) {
      final responseApi = await characterDetailUsecase.episodeDetail(
          idEpisodes: idEpisodes.join(','));
      responseApi.fold((l) {
        emit(const DetailCharacterState.error(''));
      }, (r) {
        emit(DetailCharacterState.success(characterDetailEntity!, r));
      });
    } else {
      emit(DetailCharacterState.success(characterDetailEntity!, null));
    }
  }
}
