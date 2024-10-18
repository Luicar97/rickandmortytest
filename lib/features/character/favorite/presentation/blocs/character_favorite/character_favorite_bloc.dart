import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_favorite_event.dart';
part 'character_favorite_state.dart';
part 'character_favorite_bloc.freezed.dart';

class CharacterFavoriteBloc
    extends Bloc<CharacterFavoriteEvent, CharacterFavoriteState> {
  CharacterFavoriteBloc() : super(_Initial()) {
    on<CharacterFavoriteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
