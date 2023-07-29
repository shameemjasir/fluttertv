// To parse this JSON data, do
//
//     final channels = channelsFromJson(jsonString);

import 'dart:convert';

Channels channelsFromJson(String str) => Channels.fromJson(json.decode(str));

String channelsToJson(Channels data) => json.encode(data.toJson());

class Channels {
  int id;
  String title;
  String image;
  Poster poster;
  List<Category> categories;
  List<Country> countries;

  Channels({
    required this.id,
    required this.title,
    required this.image,
    required this.poster,
    required this.categories,
    required this.countries,
  });

  factory Channels.fromJson(Map<String, dynamic> json) => Channels(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        poster: Poster.fromJson(json["poster"]),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        countries: List<Country>.from(
            json["countries"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "poster": poster.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
      };
}

class Category {
  int id;
  String title;

  Category({
    required this.id,
    required this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}

class Country {
  int id;
  String title;
  String image;

  Country({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
      };
}

class Poster {
  int id;
  String title;
  dynamic label;
  dynamic sublabel;
  String type;
  String description;
  int year;
  double imdb;
  int rating;
  String duration;
  String downloadas;
  bool comment;
  String playas;
  String classification;
  String image;
  String cover;
  dynamic genres;
  Trailer trailer;
  dynamic sources;

  Poster({
    required this.id,
    required this.title,
    this.label,
    this.sublabel,
    required this.type,
    required this.description,
    required this.year,
    required this.imdb,
    required this.rating,
    required this.duration,
    required this.downloadas,
    required this.comment,
    required this.playas,
    required this.classification,
    required this.image,
    required this.cover,
    this.genres,
    required this.trailer,
    this.sources,
  });

  factory Poster.fromJson(Map<String, dynamic> json) => Poster(
        id: json["id"],
        title: json["title"],
        label: json["label"],
        sublabel: json["sublabel"],
        type: json["type"],
        description: json["description"],
        year: json["year"],
        imdb: json["imdb"],
        rating: json["rating"],
        duration: json["duration"],
        downloadas: json["downloadas"],
        comment: json["comment"],
        playas: json["playas"],
        classification: json["classification"],
        image: json["image"],
        cover: json["cover"],
        genres: json["genres"],
        trailer: Trailer.fromJson(json["trailer"]),
        sources: json["sources"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "label": label,
        "sublabel": sublabel,
        "type": type,
        "description": description,
        "year": year,
        "imdb": imdb,
        "rating": rating,
        "duration": duration,
        "downloadas": downloadas,
        "comment": comment,
        "playas": playas,
        "classification": classification,
        "image": image,
        "cover": cover,
        "genres": genres,
        "trailer": trailer.toJson(),
        "sources": sources,
      };
}

class Trailer {
  int id;
  String? type;
  String url;

  Trailer({
    required this.id,
     this.type,
    required this.url,
  });

  factory Trailer.fromJson(Map<String, dynamic> json) => Trailer(
        id: json["id"],
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "url": url,
      };
}
