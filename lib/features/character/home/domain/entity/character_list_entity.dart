class CharacterListEntity {
  InfoEntity info;
  List<ResultEntity> results;

  CharacterListEntity({
    required this.info,
    required this.results,
  });
}

class InfoEntity {
  int count;
  int pages;
  dynamic next;
  dynamic prev;

  InfoEntity({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });
}

class ResultEntity {
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

  ResultEntity({
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
