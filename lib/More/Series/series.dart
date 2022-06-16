import 'package:cricscore/More/Series/series_domestic.dart';
import 'package:cricscore/More/Series/series_international.dart';
import 'package:cricscore/More/Series/series_t20_league.dart';
import 'package:cricscore/More/Series/series_women.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Series extends StatelessWidget {
  Series({Key? key}) : super(key: key);

  var _tabpages = [
    International(),
    T20League(),
    Domestic(),
    Women(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: _tabpages.length,
        child: Scaffold(
          backgroundColor: Color(0xff303030),
          appBar: AppBar(
            backgroundColor: Color(0xff212121),
            title: Text('Browse Series'),
            titleTextStyle:
                GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 18),
            bottom: TabBar(
              isScrollable: true,
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              unselectedLabelColor: Colors.white.withOpacity(0.5),
              tabs: [
                Tab(
                  text: 'INTERNATIONAL',
                ),
                Tab(
                  text: 'T20 LEAGUE',
                ),
                Tab(
                  text: 'DOMESTIC',
                ),
                Tab(
                  text: 'WOMEN',
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
