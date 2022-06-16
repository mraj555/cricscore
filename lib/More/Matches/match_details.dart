import 'package:cricscore/More/Matches/Match/matches.dart';
import 'package:cricscore/More/Matches/news.dart';
import 'package:cricscore/More/Matches/Points%20Table/pointstable.dart';
import 'package:cricscore/More/Matches/Squads/squads.dart';
import 'package:cricscore/More/Matches/stats.dart';
import 'package:cricscore/More/Matches/Venues/venues.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchDetails extends StatefulWidget {
  final String matchTitle;
  final String seriesId;
  const MatchDetails({Key? key,required this.matchTitle,required this.seriesId}) : super(key: key);

  @override
  State<MatchDetails> createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails> {

  @override
  Widget build(BuildContext context) {

    var _tabpages = [
      Matches(id: widget.seriesId),
      News(),
      Squads(id: widget.seriesId),
      Stats(),
      Venues(id: widget.seriesId),
      PointsTable(id: widget.seriesId,)
    ];

    return SafeArea(
      child: DefaultTabController(
        length: _tabpages.length,
        child: Scaffold(
          backgroundColor: Color(0xff303030),
          appBar: AppBar(
            backgroundColor: Color(0xff212121),
            title: Text(widget.matchTitle),
            titleTextStyle:
            GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 18),
            bottom: TabBar(
              isScrollable: true,
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              unselectedLabelColor: Colors.white.withOpacity(0.5),
              tabs: [
                Tab(
                  text: 'MATCHES',
                ),
                Tab(
                  text: 'NEWS',
                ),
                Tab(
                  text: 'SQUADS',
                ),
                Tab(
                  text: 'STATS',
                ),
                Tab(
                  text: 'VENUES',
                ),
                Tab(
                  text: 'POINTS TABLE',
                ),
              ],
              indicatorColor: Colors.white,
            ),
          ),
          body: TabBarView(
            children: _tabpages,
          ),
        ),
      ),
    );
  }
}
