// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  Model({
    required this.squadAnnouncedList,
    required this.appIndex,
  });

  final List<SquadAnnouncedList> squadAnnouncedList;
  final AppIndex appIndex;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    squadAnnouncedList: List<SquadAnnouncedList>.from(json["squadAnnouncedList"].map((x) => SquadAnnouncedList.fromJson(x))),
    appIndex: AppIndex.fromJson(json["appIndex"]),
  );

  Map<String, dynamic> toJson() => {
    "squadAnnouncedList": List<dynamic>.from(squadAnnouncedList.map((x) => x.toJson())),
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

class SquadAnnouncedList {
  SquadAnnouncedList({
    required this.squadType,
    required this.isHeader,
    required this.squadId,
  });

  final String squadType;
  final bool? isHeader;
  final int? squadId;

  factory SquadAnnouncedList.fromJson(Map<String, dynamic> json) => SquadAnnouncedList(
    squadType: json["squadType"],
    isHeader: json["isHeader"] == null ? null : json["isHeader"],
    squadId: json["squadId"] == null ? null : json["squadId"],
  );

  Map<String, dynamic> toJson() => {
    "squadType": squadType,
    "isHeader": isHeader == null ? null : isHeader,
    "squadId": squadId == null ? null : squadId,
  };
}
