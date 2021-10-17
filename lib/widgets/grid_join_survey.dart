import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:survey_app/screens/survey_question_edit_screen.dart';
import 'package:survey_app/widgets/s_image64.dart';

class GridJoinSurvey extends StatelessWidget {
  final events;

  const GridJoinSurvey({Key? key, this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = 0xff453658;

    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: this.events.map<Widget>((data) {
            return GestureDetector(
              onTap: () async {
                Get.toNamed("/doSurvey", arguments: data);
              },
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.cyanAccent]),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    data["survey"]['base64'] == "N/A"
                        ? SImage64.imageFromBase64String(SImage64.logo100)
                        : SImage64.imageFromBase64String(
                            data["survey"]['base64']),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data["survey"]['name'],
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      data["survey"]['description'],
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white38,
                              fontSize: 10,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items(
      {required this.title,
      required this.subtitle,
      required this.event,
      required this.img});
}
