// To parse this JSON data, do
//
//     final episodeDetailModel = episodeDetailModelFromJson(jsonString);

import 'dart:convert';

import 'package:trumed/features/character/detail/domain/entity/epidode_detail_entity.dart';

List<EpisodeDetailModel> episodeDetailModelFromJson(String str) {
  return List<EpisodeDetailModel>.from(jsonDecode(str).map((x) {
    return EpisodeDetailModel.fromJson(x);
  }));
}

String episodeDetailModelToJson(List<EpisodeDetailModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<EpisodeDetailEntity> toEntityEpisodeDetailModel(
    List<EpisodeDetailModel> episodeModel) {
  List<EpisodeDetailEntity> listEpisodeDetail = [];

  for (var i = 0; i < episodeModel.length; i++) {
    listEpisodeDetail.add(EpisodeDetailEntity(
      id: episodeModel[i].id,
      name: episodeModel[i].name,
      episode: episodeModel[i].episode,
      url: episodeModel[i].url,
      created: episodeModel[i].created,
      airDate: episodeModel[i].airDate,
      // characters: [],
    ));
  }

  return listEpisodeDetail;
}

class EpisodeDetailModel {
  int id;
  String name;
  String airDate;
  String episode;
  // List<String> characters;
  String url;
  DateTime created;

  EpisodeDetailModel({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    // required this.characters,
    required this.url,
    required this.created,
  });

  factory EpisodeDetailModel.fromJson(Map<String, dynamic> json) =>
      EpisodeDetailModel(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        // characters: List<String>.from(json["characters"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "air_date": airDate,
        "episode": episode,
        // "characters": List<dynamic>.from(characters.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
      };
}
