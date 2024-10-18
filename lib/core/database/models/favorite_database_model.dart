// To parse this JSON data, do
//
//     final favoriteDatabaseModel = favoriteDatabaseModelFromJson(jsonString);

import 'dart:convert';

FavoriteDatabaseEntity favoriteDatabaseModelFromJson(String str) =>
    FavoriteDatabaseEntity.fromJson(json.decode(str));

String favoriteDatabaseModelToJson(FavoriteDatabaseEntity data) =>
    json.encode(data.toJson());

class FavoriteDatabaseEntity {
  int? id;
  int characterId;
  String name;

  FavoriteDatabaseEntity({
    this.id,
    required this.characterId,
    required this.name,
  });

  factory FavoriteDatabaseEntity.fromJson(Map<String, dynamic> json) =>
      FavoriteDatabaseEntity(
        id: json["id"],
        characterId: json["character_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "character_id": characterId,
        "name": name,
      };
}
