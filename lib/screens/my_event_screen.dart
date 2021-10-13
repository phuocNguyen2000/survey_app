import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:survey_app/api/response.dart';
import 'package:survey_app/base_color.dart';
import 'package:survey_app/controllers/home/home_controller.dart';
import 'package:survey_app/main.dart';
import 'package:survey_app/models/survey.dart';
import 'package:survey_app/screens/survey_question_edit_screen.dart';
import 'package:survey_app/widgets/container_gradient_border.dart';
import 'package:survey_app/widgets/gradien_mark.dart';
import 'package:survey_app/widgets/grid_dashboard.dart';
import 'package:survey_app/widgets/grid_survey.dart';

class MyEventScreen extends StatefulWidget {
  const MyEventScreen({Key? key}) : super(key: key);

  @override
  _MyEventScreenState createState() => _MyEventScreenState();
}

class _MyEventScreenState extends State<MyEventScreen> {
  HomeController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      backgroundColor: Color(0xff392850),
      appBar: AppBar(
        leading: GradientMark(
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
          ),
          gradient:
              LinearGradient(colors: [Colors.blueAccent, Colors.cyanAccent]),
        ),
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 110,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Your Event",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Image.asset(
                    "assets/notification.png",
                    width: 24,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          FutureBuilder<DataResponse>(
            future: _controller.ownEvent(), // a Future<String> or null
            builder:
                (BuildContext context, AsyncSnapshot<DataResponse> snapshot) {
              print(snapshot);
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return new Text('Press button to start');
                case ConnectionState.waiting:
                  return new Text('Awaiting result...');
                default:
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  else {
                    List surveys = List.of(
                        jsonDecode(snapshot.data!.data.toString())["events"]);
                    print(surveys);

                    return GridSurvey(surveys: surveys);
                  }
              }
            },
          ),
          GestureDetector(
              onTap: () {
                Get.toNamed("/createEvent");
              },
              child: ContainerGradientBorder(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 50.0,
                gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.cyanAccent]),
                intColor: Colors.white,
                borderRadius: 10.0,
                child: Center(
                    child: Text(
                  "Create New",
                  style: TextStyle(color: BaseColor.primary, fontSize: 25),
                )),
              )),
        ],
      ),
    ));
  }
}
