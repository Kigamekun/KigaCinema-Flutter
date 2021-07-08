import 'dart:developer' as developer;


class Album {
  final String id;
  final String title;
  final String country;
  final String price;
  final String on_air;
  final String description;
  final String thumb;

  Album(
      {required this.id,
      required this.title,
      required this.country,
      required this.price,
      required this.description,
      required this.on_air,
      required this.thumb});

  factory Album.fromJson(Map<String, dynamic> json) {
    // developer.inspect(json);
    return Album(
      id: json["id"].toString(),
      title: json["title"],
      country: json["country"],
      price: json["price"],
      on_air: json["on_air"],
      description: json["description"],
      thumb: json["thumb"],
    );
  }
}