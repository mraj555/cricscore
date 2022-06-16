import 'package:cricscore/More/Series/model.dart';
import 'package:cricscore/More/Series/service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../Matches/match_details.dart';

class Women extends StatefulWidget {
  const Women({Key? key}) : super(key: key);

  @override
  State<Women> createState() => _WomenState();
}

class _WomenState extends State<Women> {
  HttpServices httpServices = HttpServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff303030),
      body: StreamBuilder(
        stream: httpServices.getSeries(type: 'women'),
        builder: (context, snapshot) {
          Model? posts = snapshot.data as Model?;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.network('https://assets3.lottiefiles.com/private_files/lf30_g5gmkozp.json', height: 150, width: 150),
            );
          } else {
            if (snapshot.hasData) {
              return ListView(
                children: List.generate(
                  posts!.seriesMap.length,
                  (index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          posts.seriesMap[index].date.toString(),
                          style: GoogleFonts.roboto(color: Colors.white, fontSize: 13),
                        ),
                      ),
                      for (int i = 0; i < posts.seriesMap[index].series.length; i++)
                        Column(
                          children: [
                            ListTile(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MatchDetails(
                                    matchTitle: posts.seriesMap[index].series[i].name,
                                    seriesId: posts.seriesMap[index].series[i].id.toString(),
                                  ),
                                ),
                              ),
                              tileColor: Color(0xff424242),
                              title: Text(
                                posts.seriesMap[index].series[i].name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(color: Colors.white),
                              ),
                              subtitle: Text(
                                '${DateFormat('MMM dd').format(DateTime.fromMillisecondsSinceEpoch(int.parse(posts.seriesMap[index].series[i].startDt)))} - ${DateFormat('MMM dd').format(DateTime.fromMillisecondsSinceEpoch(int.parse(posts.seriesMap[index].series[i].endDt)))}',
                                style: GoogleFonts.roboto(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ),
                            Divider(
                              color: Color(0xff303030),
                              height: 1,
                              thickness: 0.5,
                            ),
                          ],
                        ),
                    ],
                  ),
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
    );
  }
}
