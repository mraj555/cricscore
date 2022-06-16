// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  Model({
    required this.pointsTable,
    required this.appIndex,
  });

  final List<PointsTable> pointsTable;
  final AppIndex appIndex;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    pointsTable: List<PointsTable>.from(json["pointsTable"].map((x) => PointsTable.fromJson(x))),
    appIndex: AppIndex.fromJson(json["appIndex"]),
  );

  Map<String, dynamic> toJson() => {
    "pointsTable": List<dynamic>.from(pointsTable.map((x) => x.toJson())),
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

class PointsTable {
  PointsTable({
    required this.groupName,
    required this.pointsTableInfo,
  });

  final String groupName;
  final List<PointsTableInfo> pointsTableInfo;

  factory PointsTable.fromJson(Map<String, dynamic> json) => PointsTable(
    groupName: json["groupName"],
    pointsTableInfo: List<PointsTableInfo>.from(json["pointsTableInfo"].map((x) => PointsTableInfo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "groupName": groupName,
    "pointsTableInfo": List<dynamic>.from(pointsTableInfo.map((x) => x.toJson())),
  };
}

class PointsTableInfo {
  PointsTableInfo({
    required this.teamId,
    required this.teamName,
    required this.matchesPlayed,
    required this.matchesWon,
    required this.noRes,
    required this.points,
    required this.nrr,
    required this.matchesLost,
    required this.matchesDrawn,
  });

  final int teamId;
  final String teamName;
  final int? matchesPlayed;
  final int? matchesWon;
  final int? noRes;
  final int points;
  final String nrr;
  final int? matchesLost;
  final int? matchesDrawn;

  factory PointsTableInfo.fromJson(Map<String, dynamic> json) => PointsTableInfo(
    teamId: json["teamId"],
    teamName: json["teamName"],
    matchesPlayed: json["matchesPlayed"] == null ? 0 : json["matchesPlayed"],
    matchesWon: json["matchesWon"] == null ? 0 : json["matchesWon"],
    noRes: json["noRes"] == null ? 0 : json["noRes"],
    points: json["points"] == null ? 0 : json['points'],
    nrr: json["nrr"],
    matchesLost: json["matchesLost"] == null ? 0 : json["matchesLost"],
    matchesDrawn: json["matchesDrawn"] == null ? 0 : json["matchesDrawn"],
  );

  Map<String, dynamic> toJson() => {
    "teamId": teamId,
    "teamName": teamName,
    "matchesPlayed": matchesPlayed == null ? null : matchesPlayed,
    "matchesWon": matchesWon == null ? null : matchesWon,
    "noRes": noRes == null ? null : noRes,
    "points": points == null ? null : points,
    "nrr": nrr,
    "matchesLost": matchesLost == null ? null : matchesLost,
    "matchesDrawn": matchesDrawn == null ? null : matchesDrawn,
  };
}
