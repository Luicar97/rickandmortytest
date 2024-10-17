class CharacterDetailEntity {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  LocationEntity origin;
  LocationEntity location;
  String image;
  List<String> episode;
  String url;
  DateTime created;

  CharacterDetailEntity({
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
}

class LocationEntity {
  String name;
  String url;

  LocationEntity({
    required this.name,
    required this.url,
  });
}
