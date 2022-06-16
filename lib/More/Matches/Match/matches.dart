import 'package:cricscore/More/Matches/Match/model.dart';
import 'package:cricscore/More/Matches/Match/service.dart';
import 'package:cricscore/api_key.dart' as key;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class Matches extends StatefulWidget {
  final String id;

  const Matches({Key? key, required this.id}) : super(key: key);

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  HttpServices httpServices = HttpServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff303030),
      body: Center(
        child: StreamBuilder(
          stream: httpServices.getMatches(seriesId: widget.id),
          builder: (context, snapshot) {
            Model? posts = snapshot.data as Model?;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Lottie.network('https://assets3.lottiefiles.com/private_files/lf30_g5gmkozp.json', height: 150, width: 150),
              );
            } else {
              if (snapshot.hasError) {
                print(snapshot.data);
                print(snapshot.error);
              } else if (snapshot.hasData) {
                return ListView(
                  children: List.generate(
                    posts!.adWrapper.length,
                    (index) {
                      var matches = posts.adWrapper[index].matchDetails!.matches;
                      return Column(
                        children: [
                          posts.adWrapper[index].matchDetails!.key == ''
                              ? SizedBox()
                              : Container(
                                  padding: EdgeInsets.fromLTRB(15, 7, 0, 7),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${posts.adWrapper[index].matchDetails!.key}',
                                    style: GoogleFonts.roboto(color: Colors.white),
                                  ),
                                ),
                          ...List.generate(
                            matches.length,
                            (i) {
                              var team1 = matches[i].matchInfo.team1;
                              var team2 = matches[i].matchInfo.team2;
                              var team1Score = matches[i].matchScore!.team1Score.inngs1!;
                              var team2Score = matches[i].matchScore!.team2Score!.inngs1!;
                              var team3Score = matches[i].matchScore!.team1Score.inngs2!;
                              var team4Score = matches[i].matchScore!.team2Score!.inngs2!;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Color(0xff414141),
                                    width: double.infinity,
                                    padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${matches[i].matchInfo.matchDesc} • ${matches[i].matchInfo.venueInfo.city}',
                                            style: GoogleFonts.roboto(color: Colors.white.withOpacity(0.6), fontSize: 12)),
                                        SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Container(
                                              width: 250,
                                              child: Row(
                                                children: [
                                                  Image.network(
                                                    'https://unofficial-cricbuzz.p.rapidapi.com/get-image?id=${team1.imageId}&rapidapi-key=${key.api_key}',
                                                    height: 24,
                                                    width: 24,
                                                  ),
                                                  SizedBox(width: 8),
                                                  Text(
                                                    team1.teamSName,
                                                    style: GoogleFonts.roboto(
                                                        color: !(matches[i].matchInfo.status!.contains(team1.teamName)) && !(matches[i].matchInfo.status!.contains(team2.teamName))
                                                            ? Colors.white
                                                            : matches[i].matchInfo.status!.contains(team1.teamName)
                                                                ? Colors.white
                                                                : Colors.white.withOpacity(0.5),
                                                        fontSize: 13),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            team1Score.runs == 0 && team1Score.wickets == 0 && team1Score.inningsId == 0 && team1Score.overs == 0.0
                                                ? SizedBox()
                                                : Text(
                                                    '${team1Score.runs.toString()}${team1Score.wickets == 10 ? '' : '-${team1Score.wickets.toString()}'}${team1Score.isDeclared == true ? ' d' : team1Score.isFollowOn == true ? ' f' : ''}${matches[i].matchInfo.matchFormat == 'TEST' ? '' : '(${team1Score.overs.toString().contains('.6') ? (team1Score.overs + 0.4).toInt() : team1Score.overs})'}${team3Score.runs == 0 && team3Score.overs == 0.0 && team3Score.wickets == 0 && team3Score.inningsId == 0 && team3Score.isDeclared == false ? '' : ' & ${team3Score.runs.toString()}${team3Score.wickets == 10 ? '' : '-${team3Score.wickets.toString()}'}${team3Score.isDeclared == true ? ' d' : team3Score.isFollowOn == true ? ' f' : ''}'}',
                                                    style: GoogleFonts.roboto(
                                                        color: !(matches[i].matchInfo.status!.contains(team1.teamName)) && !(matches[i].matchInfo.status!.contains(team2.teamName))
                                                            ? Colors.white
                                                            : matches[i].matchInfo.status!.contains(team1.teamName)
                                                                ? Colors.white
                                                                : Colors.white.withOpacity(0.5),
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 250,
                                              child: Row(
                                                children: [
                                                  Image.network(
                                                    'https://unofficial-cricbuzz.p.rapidapi.com/get-image?id=${team2.imageId}&rapidapi-key=${key.api_key}',
                                                    height: 24,
                                                    width: 24,
                                                  ),
                                                  SizedBox(width: 8),
                                                  Text(
                                                    team2.teamSName,
                                                    style: GoogleFonts.roboto(
                                                        color: !(matches[i].matchInfo.status!.contains(team1.teamName)) && !(matches[i].matchInfo.status!.contains(team2.teamName))
                                                            ? Colors.white
                                                            : matches[i].matchInfo.status!.contains(team2.teamName)
                                                                ? Colors.white
                                                                : Colors.white.withOpacity(0.5),
                                                        fontSize: 13),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            team2Score.runs == 0 && team2Score.wickets == 0 && team2Score.inningsId == 0 && team2Score.overs == 0.0
                                                ? SizedBox()
                                                : Text(
                                                    '${team2Score.runs.toString()}${team2Score.wickets == 10 ? '' : '-${team2Score.wickets.toString()}'}${team2Score.isDeclared == true ? ' d' : team2Score.isFollowOn == true ? ' f' : ''}${matches[i].matchInfo.matchFormat == 'TEST' ? '' : '(${team2Score.overs.toString().contains('.6') ? (team2Score.overs + 0.4).toInt() : team2Score.overs})'} ${team4Score.runs == 0 && team4Score.overs == 0.0 && team4Score.wickets == 0 && team4Score.inningsId == 0 && team4Score.isDeclared == false ? '' : '& ${team4Score.runs.toString()}${team4Score.wickets == 10 ? '' : '-${team4Score.wickets.toString()}'}${team4Score.isDeclared == true ? 'd' : team4Score.isFollowOn == true ? ' f' : ''}'}',
                                                    style: GoogleFonts.roboto(
                                                        color: !(matches[i].matchInfo.status!.contains(team1.teamName)) && !(matches[i].matchInfo.status!.contains(team2.teamName))
                                                            ? Colors.white
                                                            : matches[i].matchInfo.status!.contains(team2.teamName)
                                                                ? Colors.white
                                                                : Colors.white.withOpacity(0.5),
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        matches[i].matchInfo.status! == ''
                                            ? Text(
                                                DateFormat('hh:mm a').format(
                                                  DateTime.fromMillisecondsSinceEpoch(
                                                    int.parse(matches[i].matchInfo.startDate),
                                                  ),
                                                ),
                                                style: GoogleFonts.roboto(fontSize: 14, color: Color(0xffd3760c)),
                                              )
                                            : matches[i].matchInfo.state != 'complete' && matches[i].matchInfo.state != 'Complete'
                                                ? Text(
                                                    matches[i].matchInfo.status!,
                                                    style: GoogleFonts.roboto(fontSize: 14, color: Color(0xffee7169)),
                                                  )
                                                : Text(
                                                    matches[i].matchInfo.status!,
                                                    style: GoogleFonts.roboto(fontSize: 14, color: Color(0xff88cef4)),
                                                  )
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Color(0xff303030),
                                    height: 1,
                                    thickness: 0.5,
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
