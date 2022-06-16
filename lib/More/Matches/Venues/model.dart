// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  Model({
    required this.venue,
    required this.appIndex,
  });

  final List<Venue> venue;
  final AppIndex appIndex;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    venue: List<Venue>.from(json["venue"].map((x) => Venue.fromJson(x))),
    appIndex: AppIndex.fromJson(json["appIndex"]),
  );

  Map<String, dynamic> toJson() => {
    "venue": List<dynamic>.from(venue.map((x) => x.toJson())),
    "appIndex": appIndex.toJson(),
  };
}

class AppIndex {
  AppIndex({
    required this.seoTitle,
    required this.webUrl,
  });

  final String seoTitle;
  final String webUrl;

  factory AppIndex.fromJson(Map<String, dynamic> json) => AppIndex(
    seoTitle: json["seoTitle"],
    webUrl: json["webURL"],
  );

  Map<String, dynamic> toJson() => {
    "seoTitle": seoTitle,
    "webURL": webUrl,
  };
}

class Venue {
  Venue({
    required this.id,
    required this.ground,
    required this.city,
    required this.country,
    required this.imageId,
  });

  final int id;
  final String ground;
  final String city;
  final String country;
  final String imageId;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    id: json["id"],
    ground: json["ground"],
    city: json["city"],
    country: json["country"],
    imageId: json["imageId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ground": ground,
    "city": city,
    "country": country,
    "imageId": imageId,
  };
}
