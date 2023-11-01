

class Album {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Album({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });


  factory Album.fromJson({required Map<String, dynamic> json}) => Album(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

}
