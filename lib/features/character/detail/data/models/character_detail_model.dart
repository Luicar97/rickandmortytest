// To parse this JSON data, do
//
//     final characterDetailModel = characterDetailModelFromJson(jsonString);

import 'dart:convert';

import 'package:trumed/features/character/detail/domain/entity/character_detail_entity.dart';

CharacterDetailModel characterDetailModelFromJson(String str) =>
    CharacterDetailModel.fromJson(json.decode(str));

String characterDetailModelToJson(CharacterDetailModel data) =>
    json.encode(data.toJson());

CharacterDetailEntity toEntityCharacterDetailModel(
    CharacterDetailModel characterModel) {
  return CharacterDetailEntity(
    id: characterModel.id,
    name: characterModel.name,
    status: characterModel.status,
    species: characterModel.species,
    type: characterModel.type,
    gender: characterModel.gender,
    location: LocationEntity(
        name: characterModel.location.name, url: characterModel.location.url),
    origin: LocationEntity(
        name: characterModel.origin.name, url: characterModel.origin.url),
    image: characterModel.image,
    episode: characterModel.episode,
    url: characterModel.url,
    created: characterModel.created,
  );
}

class CharacterDetailModel {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Location origin;
  Location location;
  String image;
  List<String> episode;
  String url;
  DateTime created;

  CharacterDetailModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory CharacterDetailModel.fromJson(Map<String, dynamic> json) =>
      CharacterDetailModel(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin: Location.fromJson(json["origin"]),
        location: Location.fromJson(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        "origin": origin.toJson(),
        "location": location.toJson(),
        "image": image,
        "episode": List<dynamic>.from(episode.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
      };
}

class Location {
  String name;
  String url;

  Location({
    required this.name,
    required this.url,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
