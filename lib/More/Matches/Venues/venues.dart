import 'package:cricscore/More/Matches/Venues/model.dart';
import 'package:cricscore/More/Matches/Venues/services.dart';
import 'package:cricscore/api_key.dart' as key;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Venues extends StatefulWidget {
  final String id;
  const Venues({Key? key, required this.id}) : super(key: key);

  @override
  State<Venues> createState() => _VenuesState();
}

class _VenuesState extends State<Venues> {
  HttpServices httpServices = HttpServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff303030),
      body: StreamBuilder(
        stream: httpServices.getVenues(seriesId: widget.id),
        builder: (context, snapshot) {
          Model? posts = snapshot.data as Model?;
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.network(
                'https://assets3.lottiefiles.com/private_files/lf30_g5gmkozp.json',
                height: 150,
                width: 150,
              ),
            );
          }
          else {
            if (snapshot.hasData) {
              return ListView(
                children: List.generate(
                  posts!.venue.length,
                      (index) => Column(
                    children: [
                      Container(
                        color: Color(0xff414141),
                        padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network('https://unofficial-cricbuzz.p.rapidapi.com/get-image?id=${posts.venue[index].imageId}&rapidapi-key=${key.api_key}'),
                            SizedBox(width: 8),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 275,
                                  child: Text(
                                    posts.venue[index].ground,
                                    maxLines: 2,
                                    style: GoogleFonts.roboto(color: Colors.white),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  posts.venue[index].city,
                                  style: GoogleFonts.roboto(color: Colors.white.withOpacity(0.5)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 1, color: Color(0xff303030), thickness: 0.5),
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
