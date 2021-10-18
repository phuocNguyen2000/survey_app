import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:survey_app/controllers/api_controller.dart';
import 'package:survey_app/widgets/container_gradient_border.dart';
import 'package:survey_app/widgets/gradien_mark.dart';

import '../base_color.dart';

class DoSurveyScreen extends StatefulWidget {
  const DoSurveyScreen({Key? key}) : super(key: key);

  @override
  _DoSurveyScreenState createState() => _DoSurveyScreenState();
}

class _DoSurveyScreenState extends State<DoSurveyScreen> {
  var event;
  List questions = [];
  CarouselController buttonCarouselController = CarouselController();
  List different_ans = [];

  @override
  void initState() {
    setState(() {
      this.event = Get.arguments;
      this.questions = event["survey"]["questions"];
    });
    for (var q in questions) {
      if (q["allow_diffrent_answer"] == true) {
        different_ans.add({"id": q["id"], "content": ""});
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.2),
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.5),
              carouselController: buttonCarouselController,
              items: questions.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.4,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  i["content"],
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color: Colors.greenAccent,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ),
                            i['type'] == 0
                                ? Column(
                                    children: List.of(i['options'])
                                        .map((e) => ContainerGradientBorder(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              height: 50.0,
                                              intColor: Colors.white,
                                              borderRadius: 10.0,
                                              child: ListTile(
                                                title: Text(
                                                  e["content"],
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                          color:
                                                              Color(0xffa29aac),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                                leading: Checkbox(
                                                    value: e["check"],
                                                    onChanged: (bool) {
                                                      setState(() {
                                                        this.questions[this
                                                                .questions
                                                                .indexOf(i)]
                                                            ["options"][List.of(
                                                                this.questions[this
                                                                        .questions
                                                                        .indexOf(i)]
                                                                    ["options"])
                                                            .indexOf(e)]["check"] = bool;
                                                      });
                                                    }),
                                              ),
                                            ))
                                        .toList(),
                                  )
                                : Column(
                                    children: List.of(i['options'])
                                        .map(
                                          (e) => ContainerGradientBorder(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              height: 50.0,
                                              intColor: Colors.white,
                                              borderRadius: 10.0,
                                              child: ListTile(
                                                  title: Text(
                                                    e["content"],
                                                    style: GoogleFonts.openSans(
                                                        textStyle: TextStyle(
                                                            color: Color(
                                                                0xffa29aac),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                  ),
                                                  leading: Checkbox(
                                                      value: e["check"],
                                                      onChanged: (bool) {
                                                        setState(() {
                                                          this.questions[this
                                                                  .questions
                                                                  .indexOf(i)]
                                                              ["options"][List.of(
                                                                  this.questions[this
                                                                          .questions
                                                                          .indexOf(i)]
                                                                      ["options"])
                                                              .indexOf(e)]["check"] = bool;
                                                          if (bool == true) {
                                                            for (var x in this
                                                                        .questions[
                                                                    this
                                                                        .questions
                                                                        .indexOf(
                                                                            i)]
                                                                ["options"]) {
                                                              if (x["id"] !=
                                                                  e["id"]) {
                                                                this.questions[this
                                                                        .questions
                                                                        .indexOf(i)]
                                                                    ["options"][List.of(this.questions[this
                                                                        .questions
                                                                        .indexOf(
                                                                            i)]["options"])
                                                                    .indexOf(x)]["check"] = false;
                                                              }
                                                            }
                                                          }
                                                        });
                                                      }))),
                                        )
                                        .toList(),
                                  ),
                            i["allow_diffrent_answer"] == true
                                ? TextField(
                                    onChanged: (text) {
                                      setState(() {
                                        for (var q in this.different_ans) {
                                          if (q["id"] == i["id"]) {
                                            this.different_ans[this
                                                .different_ans
                                                .indexOf(q)]["content"] = text;
                                          }
                                        }
                                      });
                                    },
                                  )
                                : Divider(),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () => buttonCarouselController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear),
                  child: Icon(Icons.arrow_left),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: questions
                      .map((e) => RaisedButton(
                            onPressed: () => buttonCarouselController
                                .animateToPage(questions.indexOf(e),
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.linear),
                            child: Text((questions.indexOf(e) + 1).toString()),
                          ))
                      .toList(),
                ),
                RaisedButton(
                  onPressed: () => buttonCarouselController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear),
                  child: Icon(Icons.arrow_right),
                )
              ],
            ),
            GestureDetector(
                onTap: () async {
                  List n_questions = [];
                  for (var q in questions) {
                    List ans = [];
                    if (q["allow_diffrent_answer"] == true) {
                      for (var dif in this.different_ans) {
                        if (dif["id"] == q["id"]) {
                          ans.add(
                              {"id": ans.length, "content": dif["content"]});
                        }
                      }
                    }
                    for (var o in q["options"]) {
                      if (o["check"] == true) {
                        ans.add({"id": ans.length, "content": o["content"]});
                      }
                    }
                    n_questions.add({"id": q["id"], "answers": ans});
                  }
                  var ev = {
                    "event": {
                      "id": this.event["id"],
                      "survey": {
                        "id": this.event["id"],
                        "questions": n_questions
                      }
                    }
                  };
                  ApiController apiController = ApiController();
                  var data = await apiController.doSurvey(ev);
                  print(data.toString());
                },
                child: ContainerGradientBorder(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 60,
                  gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.cyanAccent]),
                  intColor: Colors.white,
                  borderRadius: 10.0,
                  child: Center(
                      child: Text(
                    "Submit",
                    style: TextStyle(color: BaseColor.primary, fontSize: 25),
                  )),
                )),
          ],
        ),
      ),
    );
  }
}
