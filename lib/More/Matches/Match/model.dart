// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  Model({
    required this.adWrapper,
    required this.appIndex,
  });

  final List<AdWrapper> adWrapper;
  final AppIndex appIndex;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        adWrapper: List<AdWrapper>.from(json["adWrapper"].map((x) => AdWrapper.fromJson(x))),
        appIndex: AppIndex.fromJson(json["appIndex"]),
      );

  Map<String, dynamic> toJson() => {
        "adWrapper": List<dynamic>.from(adWrapper.map((x) => x.toJson())),
        "appIndex": appIndex.toJson(),
      };
}

class AdWrapper {
  AdWrapper({
    required this.matchDetails,
  });

  final MatchDetails? matchDetails;

  factory AdWrapper.fromJson(Map<String, dynamic> json) => AdWrapper(
        matchDetails: json["matchDetails"] == null ? MatchDetails(key: '', matches: [], seriesId: 0) : MatchDetails.fromJson(json["matchDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "matchDetails": matchDetails == null ? null : matchDetails!.toJson(),
      };
}

class MatchDetails {
  MatchDetails({
    required this.key,
    required this.matches,
    required this.seriesId,
  });

  final String key;
  final List<Match> matches;
  final int seriesId;

  factory MatchDetails.fromJson(Map<String, dynamic> json) => MatchDetails(
        key: json["key"],
        matches: List<Match>.from(json["matches"].map((x) => Match.fromJson(x))),
        seriesId: json["seriesId"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "matches": List<dynamic>.from(matches.map((x) => x.toJson())),
        "seriesId": seriesId,
      };
}

class Match {
  Match({required this.matchInfo, required this.matchScore});

  final MatchInfo matchInfo;
  final MatchScore? matchScore;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        matchInfo: MatchInfo.fromJson(json["matchInfo"]),
        matchScore: json["matchScore"] == null
            ? MatchScore(
                team1Score: TeamScore(
                    inngs1: Inngs1(isDeclared: false, inningsId: 0, runs: 0, wickets: 0, overs: 0.0, isFollowOn: false),
                    inngs2: Inngs2(runs: 0, inningsId: 0, overs: 0.0, wickets: 0, isDeclared: false, isFollowOn: false)),
                team2Score: TeamScore(
                    inngs1: Inngs1(isDeclared: false, inningsId: 0, runs: 0, wickets: 0, overs: 0.0, isFollowOn: false),
                    inngs2: Inngs2(runs: 0, inningsId: 0, overs: 0.0, wickets: 0, isDeclared: false, isFollowOn: false)))
            : MatchScore.fromJson(json["matchScore"]),
      );

  Map<String, dynamic> toJson() => {
        "matchInfo": matchInfo.toJson(),
        "matchScore": matchScore == null ? null : matchScore!.toJson(),
      };
}

class MatchInfo {
  MatchInfo({
    required this.matchId,
    required this.seriesId,
    required this.seriesName,
    required this.matchDesc,
    required this.matchFormat,
    required this.startDate,
    required this.endDate,
    required this.state,
    required this.status,
    required this.team1,
    required this.team2,
    required this.venueInfo,
    required this.currentBatTeamId,
    required this.seriesStartDt,
    required this.seriesEndDt,
  });

  final int matchId;
  final int seriesId;
  final String seriesName;
  final String matchDesc;
  final String matchFormat;
  final String startDate;
  final String endDate;
  final String state;
  final String? status;
  final Team team1;
  final Team team2;
  final VenueInfo venueInfo;
  final int? currentBatTeamId;
  final String? seriesStartDt;
  final String? seriesEndDt;

  factory MatchInfo.fromJson(Map<String, dynamic> json) => MatchInfo(
        matchId: json["matchId"],
        seriesId: json["seriesId"],
        seriesName: json["seriesName"],
        matchDesc: json["matchDesc"],
        matchFormat: json["matchFormat"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        state: json["state"],
        status: json['status'] == null ? '' : json['status'],
        team1: Team.fromJson(json["team1"]),
        team2: Team.fromJson(json["team2"]),
        venueInfo: VenueInfo.fromJson(json["venueInfo"]),
        currentBatTeamId: json['currentBatTeamId'] == null ? 0 : json['currentBatTeamId'],
        seriesStartDt: json["seriesStartDt"] == null ? '' : json["seriesStartDt"],
        seriesEndDt: json["seriesEndDt"] == null ? '' : json["seriesEndDt"],
      );

  Map<String, dynamic> toJson() => {
        "matchId": matchId,
        "seriesId": seriesId,
        "seriesName": seriesName,
        "matchDesc": matchDesc,
        "matchFormat": matchFormat,
        "startDate": startDate,
        "endDate": endDate,
        "state": state,
        "status": status,
        "team1": team1.toJson(),
        "team2": team2.toJson(),
        "venueInfo": venueInfo.toJson(),
        "currentBatTeamId": currentBatTeamId,
        "seriesStartDt": seriesStartDt == null ? null : seriesStartDt,
        "seriesEndDt": seriesEndDt == null ? null : seriesEndDt,
      };
}

class Team {
  Team({
    required this.teamId,
    required this.teamName,
    required this.teamSName,
    required this.imageId,
  });

  final int teamId;
  final String teamName;
  final String teamSName;
  final int imageId;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        teamId: json["teamId"],
        teamName: json["teamName"],
        teamSName: json["teamSName"],
        imageId: json["imageId"],
      );

  Map<String, dynamic> toJson() => {
        "teamId": teamId,
        "teamName": teamName,
        "teamSName": teamSName,
        "imageId": imageId,
      };
}

class VenueInfo {
  VenueInfo({
    required this.id,
    required this.ground,
    required this.city,
    required this.timezone,
  });

  final int? id;
  final String ground;
  final String city;
  final String timezone;

  factory VenueInfo.fromJson(Map<String, dynamic> json) => VenueInfo(
        id: json["id"] == null ? 0 : json['id'],
        ground: json["ground"],
        city: json["city"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "ground": ground,
        "city": city,
        "timezone": timezone,
      };
}

class MatchScore {
  MatchScore({
    required this.team1Score,
    required this.team2Score,
  });

  final TeamScore team1Score;
  final TeamScore? team2Score;

  factory MatchScore.fromJson(Map<String, dynamic> json) => MatchScore(
        team1Score: TeamScore.fromJson(json["team1Score"]),
        team2Score: json["team2Score"] == null
            ? TeamScore(
                inngs1: Inngs1(runs: 0, inningsId: 0, overs: 0.0, wickets: 0, isDeclared: false, isFollowOn: false),
                inngs2: Inngs2(runs: 0, inningsId: 0, overs: 0.0, wickets: 0, isDeclared: false, isFollowOn: false))
            : TeamScore.fromJson(json["team2Score"]),
      );

  Map<String, dynamic> toJson() => {
        "team1Score": team1Score.toJson(),
        "team2Score": team2Score == null ? null : team2Score!.toJson(),
      };
}

class TeamScore {
  TeamScore({
    required this.inngs1,
    required this.inngs2,
  });

  final Inngs1? inngs1;
  final Inngs2? inngs2;

  factory TeamScore.fromJson(Map<String, dynamic> json) => TeamScore(
        inngs1: json['inngs1'] == null ? Inngs1(inningsId: 0, runs: 0, wickets: 0, overs: 0, isDeclared: false, isFollowOn: false) : Inngs1.fromJson(json["inngs1"]),
        inngs2: json['inngs2'] == null ? Inngs2(inningsId: 0, runs: 0, wickets: 0, overs: 0, isDeclared: false, isFollowOn: false) : Inngs2.fromJson(json["inngs2"]),
      );

  Map<String, dynamic> toJson() => {
        "inngs1": inngs1 == null ? null : inngs1!.toJson(),
        "inngs2": inngs2 == null ? null : inngs2!.toJson(),
      };
}

class Inngs1 {
  Inngs1({required this.inningsId, required this.runs, required this.wickets, required this.overs, required this.isDeclared, required this.isFollowOn});

  final int inningsId;
  final int runs;
  final int? wickets;
  final double overs;
  final bool? isDeclared;
  final bool? isFollowOn;

  factory Inngs1.fromJson(Map<String, dynamic> json) => Inngs1(
      inningsId: json["inningsId"],
      runs: json["runs"],
      wickets: json["wickets"] == null ? 0 : json["wickets"],
      overs: json["overs"].toDouble(),
      isDeclared: json['isDeclared'] == null ? false : json['isDeclared'],
      isFollowOn: json["isFollowOn"] == null ? false : json["isFollowOn"]);

  Map<String, dynamic> toJson() => {
        "inningsId": inningsId,
        "runs": runs,
        "wickets": wickets == null ? null : wickets,
        "overs": overs,
        "isDeclared": isDeclared == null ? null : isDeclared,
        "isFollowOn": isFollowOn == null ? null : isFollowOn
      };
}

class Inngs2 {
  Inngs2({required this.inningsId, required this.runs, required this.wickets, required this.overs, required this.isDeclared, required this.isFollowOn});

  final int inningsId;
  final int? runs;
  final int? wickets;
  final double? overs;
  final bool? isDeclared;
  final bool? isFollowOn;

  factory Inngs2.fromJson(Map<String, dynamic> json) => Inngs2(
      inningsId: json["inningsId"],
      runs: json["runs"] == null ? 0 : json["runs"],
      wickets: json["wickets"] == null ? 0 : json["wickets"],
      overs: json["overs"] == null ? 0.0 : json["overs"].toDouble(),
      isDeclared: json['isDeclared'] == null ? false : json['isDeclared'],
      isFollowOn: json['isFollowOn'] == null ? false : json['isFollowOn']);

  Map<String, dynamic> toJson() => {
        "inningsId": inningsId,
        "runs": runs == null ? null : runs,
        "wickets": wickets == null ? null : wickets,
        "overs": overs == null ? null : overs,
        "isDeclared": isDeclared == null ? null : isDeclared,
        "isFollowOn": isFollowOn == null ? null : isFollowOn
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
