import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:survey_app/screens/survey_question_edit_screen.dart';

class GridEvent extends StatelessWidget {
  final events;
  final action;

  const GridEvent({
    Key? key,
    this.events,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = 0xff453658;

    return Flexible(
      child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 16, right: 16),
          children: this.events.map<Widget>((data) {
            return GestureDetector(
              onTap: () async {},
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.cyanAccent]),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data["survey"]['name'].toString(),
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
                      data["end"].toString(),
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white38,
                              fontSize: 10,
                              fontWeight: FontWeight.w600)),
                    ),
                    data["payment"][0]["state"] == false
                        ? TextButton(onPressed: () {}, child: Text("Buy Now"))
                        : SizedBox(
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
