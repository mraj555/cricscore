import 'package:cricscore/More/Matches/Points%20Table/model.dart';
import 'package:cricscore/More/Matches/Points%20Table/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PointsTable extends StatefulWidget {
  final String id;

  const PointsTable({Key? key, required this.id}) : super(key: key);

  @override
  State<PointsTable> createState() => _PointsTableState();
}

class _PointsTableState extends State<PointsTable> {
  HttpServices httpServices = HttpServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff303030),
      body: StreamBuilder(
        stream: httpServices.getPointsTable(seriesId: widget.id),
        builder: (context, snapshot) {
          Model? posts = snapshot.data as Model?;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.network('https://assets3.lottiefiles.com/private_files/lf30_g5gmkozp.json', height: 150, width: 150),
            );
          } else {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            if (snapshot.hasData) {
              return ListView(
                children: List.generate(
                  posts!.pointsTable.length,
                  (i) {
                    print(posts.pointsTable.length);
                    return Column(
                      children: [
                        posts.pointsTable.length <= 1
                            ? SizedBox()
                            : Container(
                                color: Color(0xff313130),
                                padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  posts.pointsTable[i].groupName.toUpperCase(),
                                  style: GoogleFonts.roboto(color: Colors.white),
                                ),
                              ),
                        Divider(height: 1, thickness: 0.5, color: Color(0xff424242)),
                        Table(
                          columnWidths: {
                            0: FlexColumnWidth(4),
                            1: FlexColumnWidth(),
                            2: FlexColumnWidth(),
                            3: FlexColumnWidth(),
                            4: FlexColumnWidth(),
                            5: FlexColumnWidth(1.2),
                            6: FlexColumnWidth(2),
                          },
                          border: TableBorder(horizontalInside: BorderSide(color: Color(0xff303030))),
                          children: [
                            TableRow(
                              decoration: BoxDecoration(
                                color: Color(0xff363636),
                              ),
                              children: [
                                tableCell(title: 'Teams', bottom: 10, left: 15, top: 10),
                                tableCell(title: 'P', bottom: 10, top: 10, opacity: 0.5, end: true),
                                tableCell(title: 'W', bottom: 10, top: 10, opacity: 0.5, end: true),
                                tableCell(title: 'L', bottom: 10, top: 10, opacity: 0.5, end: true),
                                tableCell(title: 'NR', bottom: 10, top: 10, opacity: 0.5, end: true),
                                tableCell(title: 'Pts', bottom: 10, top: 10, end: true),
                                tableCell(title: 'NRR', bottom: 10, top: 10, right: 10, opacity: 0.5, end: true),
                              ],
                            ),
                            ...List.generate(
                              posts.pointsTable[i].pointsTableInfo.length,
                              (index) {
                                var info = posts.pointsTable[i].pointsTableInfo;
                                return TableRow(
                                  decoration: BoxDecoration(color: Color(0xff424242)),
                                  children: [
                                    tableCell(title: info[index].teamName, bottom: 18, left: 15, top: 18),
                                    tableCell(title: '${info[index].matchesPlayed == null ? '0' : '${info[index].matchesPlayed.toString()}'}', bottom: 18, top: 18, opacity: 0.5, end: true),
                                    tableCell(title: '${info[index].matchesWon == null ? '0' : '${info[index].matchesWon.toString()}'}', bottom: 18, top: 18, opacity: 0.5, end: true),
                                    tableCell(title: '${info[index].matchesLost == null ? '0' : '${info[index].matchesLost.toString()}'}', bottom: 18, top: 18, opacity: 0.5, end: true),
                                    tableCell(title: '${info[index].noRes == null ? '0' : '${info[index].noRes.toString()}'}', bottom: 18, top: 18, opacity: 0.5, end: true),
                                    tableCell(title: info[index].points.toString(), bottom: 18, top: 18, end: true),
                                    tableCell(title: info[index].nrr, bottom: 18, top: 18, right: 10, opacity: 0.5, end: true),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Points Table not available.', style: GoogleFonts.roboto(color: Colors.white)),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  tableCell({bool? end, required String title, double? opacity, double left = 0.0, double top = 0.0, double right = 0.0, double bottom = 0.0}) {
    return TableCell(
      child: Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: Text(
          title,
          textAlign: end == null ? TextAlign.start : TextAlign.end,
          style: GoogleFonts.roboto(
            color: Colors.white.withOpacity(opacity == null ? 1.0 : opacity),
          ),
        ),
      ),
    );
  }
}
