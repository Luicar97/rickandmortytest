class EpisodeDetailEntity {
  int id;
  String name;
  String airDate;
  String episode;
  // List<String> characters;
  String url;
  DateTime created;

  EpisodeDetailEntity({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    // required this.characters,
    required this.url,
    required this.created,
  });
}
