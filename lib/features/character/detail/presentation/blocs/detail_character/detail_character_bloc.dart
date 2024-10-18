import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:trumed/core/database/database.dart';
import 'package:trumed/core/database/models/favorite_database_model.dart';
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
    on<_AddFavorite>(_addFavorite);
  }

  CharacterDetailUsecase characterDetailUsecase;
  DatabaseHelper dbHelper = DatabaseHelper();
  CharacterDetailEntity? characterDetailEntity;
  List<EpisodeDetailEntity>? listEpisode;

  FutureOr<void> _detailCharacter(
      _DetailCharacter event, Emitter<DetailCharacterState> emit) async {
    List<String> idEpisodes = [];

    emit(const DetailCharacterState.loading());

    final response = await characterDetailUsecase.characterDetail(id: event.id);

    FavoriteDatabaseEntity? favorite = await dbHelper.getFavoriteById(event.id);

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
        listEpisode = r;
        emit(DetailCharacterState.success(
            characterDetailEntity!, listEpisode, favorite));
      });
    } else {
      listEpisode = null;
      emit(DetailCharacterState.success(
          characterDetailEntity!, listEpisode, favorite));
    }
  }

  FutureOr<void> _addFavorite(
      _AddFavorite event, Emitter<DetailCharacterState> emit) async {
    emit(const DetailCharacterState.loading());

    FavoriteDatabaseEntity? favorite = await dbHelper.getFavoriteById(event.id);

    if (favorite == null) {
      dbHelper.insertFavorite(event.id, event.name, event.image);
      emit(DetailCharacterState.success(characterDetailEntity!, listEpisode,
          FavoriteDatabaseEntity(characterId: event.id, name: event.name)));
    } else {
      dbHelper.deleteFavorite(event.id);
      emit(DetailCharacterState.success(
          characterDetailEntity!, listEpisode, null));
    }
  }
}
