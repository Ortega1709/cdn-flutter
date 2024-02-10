class SongModel {
  final String id;
  final String title;
  final String artist;
  final String type;
  final String link;

  SongModel(
      {required this.id,
      required this.title,
      required this.artist,
      required this.type,
      required this.link});

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
        id: json["id"],
        title: json["title"],
        artist: json["artist"],
        type: json["type"],
        link: json["link"]);
  }
}
