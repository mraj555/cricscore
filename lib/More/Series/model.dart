// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  Model({
    required this.seriesMap,
    required this.appIndex,
  });

  final List<SeriesMap> seriesMap;
  final AppIndex appIndex;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    seriesMap: List<SeriesMap>.from(json["seriesMap"].map((x) => SeriesMap.fromJson(x))),
    appIndex: AppIndex.fromJson(json["appIndex"]),
  );

  Map<String, dynamic> toJson() => {
    "seriesMap": List<dynamic>.from(seriesMap.map((x) => x.toJson())),
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

class SeriesMap {
  SeriesMap({
    required this.date,
    required this.series,
  });

  final String date;
  final List<Series> series;

  factory SeriesMap.fromJson(Map<String, dynamic> json) => SeriesMap(
    date: json["date"],
    series: List<Series>.from(json["series"].map((x) => Series.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "series": List<dynamic>.from(series.map((x) => x.toJson())),
  };
}

class Series {
  Series({
    required this.id,
    required this.name,
    required this.startDt,
    required this.endDt,
  });

  final int id;
  final String name;
  final String startDt;
  final String endDt;

  factory Series.fromJson(Map<String, dynamic> json) => Series(
    id: json["id"],
    name: json["name"],
    startDt: json["startDt"],
    endDt: json["endDt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "startDt": startDt,
    "endDt": endDt,
  };
}
