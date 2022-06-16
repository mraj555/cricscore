import 'package:cricscore/More/Matches/Squads/model.dart';
import 'package:cricscore/More/Matches/Squads/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Squads extends StatefulWidget {
  final String id;

  const Squads({Key? key, required this.id}) : super(key: key);

  @override
  State<Squads> createState() => _SquadsState();
}

class _SquadsState extends State<Squads> {
  HttpServices httpServices = HttpServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff303030),
      body: StreamBuilder(
        stream: httpServices.getSquads(seriesId: widget.id),
        builder: (context, snapshot) {
          Model? posts = snapshot.data as Model?;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.network('https://assets3.lottiefiles.com/private_files/lf30_g5gmkozp.json', height: 150, width: 150),
            );
          } else {
            if(snapshot.hasData) {
              return ListView(
                children: List.generate(
                  posts!.squadAnnouncedList.length,
                      (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        posts.squadAnnouncedList[index].isHeader == true
                            ? Container(
                          padding: EdgeInsets.fromLTRB(15, 7, 0, 7),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            posts.squadAnnouncedList[index].squadType.toUpperCase(),
                            style: GoogleFonts.roboto(color: Colors.white),
                          ),
                        )
                            : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              tileColor: Color(0xff424242),
                              title: Text(
                                posts.squadAnnouncedList[index].squadType,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(color: Colors.white),
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
                    );
                  },
                ),
              );
            }
            if(snapshot.hasError) {
             print(snapshot.error);
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
