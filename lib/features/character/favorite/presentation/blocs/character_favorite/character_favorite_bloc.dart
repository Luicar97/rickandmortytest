import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:trumed/core/database/database.dart';
import 'package:trumed/core/database/models/favorite_database_model.dart';

part 'character_favorite_event.dart';
part 'character_favorite_state.dart';
part 'character_favorite_bloc.freezed.dart';

@injectable
class CharacterFavoriteBloc
    extends Bloc<CharacterFavoriteEvent, CharacterFavoriteState> {
  CharacterFavoriteBloc() : super(const _Initial()) {
    on<_ListFavorite>(_listFavorite);
    on<_DeleteFavorite>(_deleteFavorite);
  }

  DatabaseHelper dbHelper = DatabaseHelper();
  List<FavoriteDatabaseEntity> listFavorite = [];

  FutureOr<void> _listFavorite(
      _ListFavorite event, Emitter<CharacterFavoriteState> emit) async {
    emit(const CharacterFavoriteState.loading());
    List<FavoriteDatabaseEntity> favorites = await dbHelper.getFavorites();

    listFavorite = favorites;

    emit(CharacterFavoriteState.success(favorites));
  }

  FutureOr<void> _deleteFavorite(
      _DeleteFavorite event, Emitter<CharacterFavoriteState> emit) async {
    dbHelper.deleteFavorite(event.characterId);

    add(const _ListFavorite());
  }
}
