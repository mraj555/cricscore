import 'package:cricscore/More/Series/series.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff303030),
        appBar: AppBar(
          backgroundColor: Color(0xff212121),
          title: Text('More'),
          titleTextStyle: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        body: ListView(
          children: [
            SizedBox(height: 20),
            tiles(tileicon: 'trophy.png', title: 'Browse Series', act: Series()),
            Divider(height: 1, color: Color(0xff303030), thickness: 0.5),
            tiles(tileicon: 'team.png', title: 'Browse Team', act: Series()),
            Divider(height: 1, color: Color(0xff303030), thickness: 0.5),
            tiles(tileicon: 'player.png', title: 'Browse Player', act: Series()),
            SizedBox(height: 20),
            tiles(tileicon: 'schedule.png', title: 'Schedule', act: Series()),
            Divider(height: 1, color: Color(0xff303030), thickness: 0.5),
            tiles(tileicon: 'archieve.png', title: 'Archieve', act: Series()),
            SizedBox(height: 20),
            tiles(tileicon: 'games.png', title: 'Games', act: Series()),
            SizedBox(height: 20),
            tiles(tileicon: 'photos.png', title: 'Photos', act: Series()),
            SizedBox(height: 20),
            tiles(tileicon: 'quiz.png', title: 'Quiz', act: Series()),
            SizedBox(height: 20),
            tiles(tileicon: 'quotes.png', title: 'Quotes', act: Series()),
            SizedBox(height: 20),
            tiles(tileicon: 'ranking.png', title: 'ICC Rankings - Men', act: Series()),
            Divider(height: 1, color: Color(0xff303030), thickness: 0.5),
            tiles(tileicon: 'ranking.png', title: 'ICC Rankings - Women', act: Series()),
            Divider(height: 1, color: Color(0xff303030), thickness: 0.5),
            tiles(tileicon: 'records.png', title: 'Records', act: Series()),
            SizedBox(height: 20),
            tiles(tileicon: 'icc.png', title: 'ICC World Test Championship', act: Series()),
            Divider(height: 1, color: Color(0xff303030), thickness: 0.5),
            tiles(tileicon: 'icc.png', title: 'ICC World Cup Super League', act: Series()),
            SizedBox(height: 20),
            tiles(tileicon: 'rate.png', title: 'Rate the App', act: Series()),
            Divider(height: 1, color: Color(0xff303030), thickness: 0.5),
            tiles(tileicon: 'feedback.png', title: 'Feedback', act: Series()),
            SizedBox(height: 20),
            tiles(tileicon: 'settings.png', title: 'Settings', act: Series()),
            Divider(height: 1, color: Color(0xff303030), thickness: 0.5),
            tiles(tileicon: 'about.png', title: 'About Cricscore', act: Series()),
          ],
        ),
      ),
    );
  }

  tiles(
      {required String tileicon,
      required String title,
      required Widget act}) {
    return ListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => act)),
      tileColor: Color(0xff424242),
      leading: ImageIcon(
        AssetImage('assets/more/$tileicon'),
        color: Colors.white,
        size: 25,
      ),
      title: Text(
        title,
        style: GoogleFonts.roboto(color: Colors.white),
      ),
    );
  }
}
