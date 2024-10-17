// To parse this JSON data, do
//
//     final characterListModel = characterListModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:trumed/features/character/home/domain/entity/character_list_entity.dart';

part 'character_list_model.freezed.dart';
part 'character_list_model.g.dart';

CharacterListModel characterListModelFromJson(String str) =>
    CharacterListModel.fromJson(json.decode(str));

String characterListModelToJson(CharacterListModel data) =>
    json.encode(data.toJson());

CharacterListEntity toEntityCharacterListModel(
    CharacterListModel characterModel) {
  final resultEntityList = <ResultEntity>[];

  for (var i = 0; i < characterModel.results.length; i++) {
    final initialSurveyEntity = ResultEntity(
      id: characterModel.results[i].id,
      name: characterModel.results[i].name,
      status: characterModel.results[i].status,
      species: characterModel.results[i].species,
      type: characterModel.results[i].type,
      gender: characterModel.results[i].gender,
      origin: LocationEntity(
        name: characterModel.results[i].location.name,
        url: characterModel.results[i].location.url,
      ),
      location: LocationEntity(
        name: characterModel.results[i].location.name,
        url: characterModel.results[i].location.url,
      ),
      image: characterModel.results[i].image,
      episode: characterModel.results[i].episode,
      url: characterModel.results[i].url,
      created: characterModel.results[i].created,
    );

    resultEntityList.add(initialSurveyEntity);
  }

  return CharacterListEntity(
    info: InfoEntity(
      count: characterModel.info.count,
      pages: characterModel.info.pages,
      next: characterModel.info.next,
      prev: characterModel.info.prev,
    ),
    results: resultEntityList,
  );
}

@freezed
class CharacterListModel with _$CharacterListModel {
  const factory CharacterListModel({
    required Info info,
    required List<Result> results,
  }) = _CharacterListModel;

  factory CharacterListModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterListModelFromJson(json);
}

@freezed
class Info with _$Info {
  const factory Info({
    required int count,
    required int pages,
    required dynamic next,
    required dynamic prev,
  }) = _Info;

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required Location origin,
    required Location location,
    required String image,
    required List<String> episode,
    required String url,
    required DateTime created,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    required String name,
    required String url,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
