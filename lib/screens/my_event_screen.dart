import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:survey_app/api/response.dart';
import 'package:survey_app/base_color.dart';
import 'package:survey_app/controllers/home/home_controller.dart';
import 'package:survey_app/generated/l10n.dart';
import 'package:survey_app/widgets/container_gradient_border.dart';
import 'package:survey_app/widgets/gradien_mark.dart';
import 'package:survey_app/widgets/grid_event.dart';

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
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      S.current.event,
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
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return new Text('Press button to start');
                case ConnectionState.waiting:
                  return new Text('Awaiting result...');
                default:
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  else {
                    List events = List.of(
                        jsonDecode(snapshot.data!.data.toString())["events"]);

                    return GridEvent(
                      events: events,
                    );
                  }
              }
            },
          ),
          GestureDetector(
              onTap: () async {
                DataResponse d = await _controller.ownSurvey();
                List ss = List.of(jsonDecode(d.data.toString())["surveys"]);

                Get.toNamed("/createEvent", arguments: ss);
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
                  S.current.create_new,
                  style: TextStyle(color: BaseColor.primary, fontSize: 25),
                )),
              )),
        ],
      ),
    ));
  }
}
