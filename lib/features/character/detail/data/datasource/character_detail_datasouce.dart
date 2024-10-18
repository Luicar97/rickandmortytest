import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:trumed/features/character/detail/data/models/character_detail_model.dart';
import 'package:trumed/features/character/detail/data/models/episode_detail_model.dart';

class CharacterDetailRemoteDataSource {
  ///
  CharacterDetailRemoteDataSource(this.dio, this.baseUrl);

  ///
  final Dio dio;

  ///
  final String baseUrl;

  Future<CharacterDetailModel> characterDetail({required int id}) async {
    final response = await dio.get(
      '$baseUrl/character/$id',
    );
    return CharacterDetailModel.fromJson(response.data);
  }

  Future<List<EpisodeDetailModel>> episodeDetail(
      {required String idEpisodes}) async {
    final response = await dio.get(
      '$baseUrl/episode/$idEpisodes',
    );

    return episodeDetailModelFromJson((idEpisodes.contains(','))
        ? jsonEncode(response.data)
        : jsonEncode([response.data]));
  }
}
