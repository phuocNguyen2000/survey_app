import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:survey_app/base_color.dart';
import 'package:survey_app/controllers/api_controller.dart';
import 'package:survey_app/enum/question_type.dart';
import 'package:survey_app/widgets/container_gradient_border.dart';
import 'package:survey_app/widgets/edt_question_layout.dart';
import 'package:survey_app/widgets/gradien_mark.dart';
import 'package:survey_app/widgets/s_text_field.dart';

class SurveyQuestionEditScreen extends StatefulWidget {
  const SurveyQuestionEditScreen({Key? key, this.survey}) : super(key: key);
  final survey;

  @override
  _SurveyQuestionEditScreenState createState() =>
      _SurveyQuestionEditScreenState();
}

class _SurveyQuestionEditScreenState extends State<SurveyQuestionEditScreen> {
  final questionController = TextEditingController();
  final TextEditingController surveyNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final questions = [
    // {
    //   "id": 0,
    //   "limit": 0,
    //   "content": "cau hoi 1",
    //   "types": "checkbox",
    //   "options": [
    //     {"id": 0, "content": "option1"},
    //   ]
    // },
    // {
    //   "id": 1,
    //   "limit": 0,
    //   "content": "cau hoi 2",
    //   "types": "checkbox",
    //   "options": [
    //     {"id": 0, "content": "option1"},
    //   ]
    // },
    // {
    //   "id": 2,
    //   "limit": 0,
    //   "content": "cau hoi 3",
    //   "types": "checkbox",
    //   "options": [
    //     {"id": 0, "content": "option1"},
    //   ]
    // },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          child: Center(
                            child: Column(
                              children: [
                                ContainerGradientBorder(
                                  width: size.width * 0.4,
                                  height: 50,
                                  intColor: Colors.white,
                                  borderRadius: 10,
                                  child: XTextField(
                                      icon: Icons.email,
                                      hintText: "your survey name",
                                      controller: surveyNameController),
                                  gradient: LinearGradient(colors: [
                                    Colors.blueAccent,
                                    Colors.cyanAccent
                                  ]),
                                ),
                                ContainerGradientBorder(
                                  width: size.width * 0.4,
                                  height: 50,
                                  intColor: Colors.white,
                                  borderRadius: 10,
                                  child: XTextField(
                                    icon: Icons.account_box_outlined,
                                    hintText: "Description",
                                    controller: descriptionController,
                                  ),
                                  gradient: LinearGradient(colors: [
                                    Colors.blueAccent,
                                    Colors.cyanAccent
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: FloatingActionButton(
                              onPressed: () {
                                this.setState(() {
                                  this.questions.add({
                                    "id": this.questions.length,
                                    "limit": 0,
                                    "content": "",
                                    "allow_diffrent_answer": false,
                                    "type": QuestionTypes.Checkbox.index,
                                    "options": []
                                  });
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                          ))
                    ],
                  ),
                ),
                Flexible(
                    flex: 5,
                    child: SingleChildScrollView(
                      child: Column(
                        children: questions.map((e) {
                          return EdtQuestionLayout(
                            allowDifferentAnswer: (id, value) {
                              if (e["id"] == id) {
                                this.setState(() {
                                  this.questions[this.questions.indexOf(e)]
                                      ["allow_diffrent_answer"] = value;
                                });
                              }
                            },
                            setType: (id, type) {
                              if (e["id"] == id) {
                                this.setState(() {
                                  this.questions[this.questions.indexOf(e)]
                                      ["type"] = type.index;
                                });
                              }
                            },
                            changequestion: (text, id) {
                              if (e["id"] == id) {
                                this.setState(() {
                                  this.questions[this.questions.indexOf(e)]
                                      ["content"] = text;
                                });
                              }
                            },
                            changeoption: (text, id) {
                              setState(() {
                                List options =
                                    jsonDecode(jsonEncode(e["options"]));
                                options.forEach((element) {
                                  if (element["id"] == id) {
                                    options[options.indexOf(element)]
                                        ["content"] = text;
                                  }
                                });
                                this.questions[this.questions.indexOf(e)]
                                    ["options"] = options;
                              });
                            },
                            element: e,
                            addoption: () {
                              setState(() {
                                String s = jsonEncode(e["options"]);
                                print("S" + s);
                                List options = jsonDecode(s);
                                options.add({
                                  "id": options.length,
                                  "content": "option1"
                                });
                                this.questions[this.questions.indexOf(e)]
                                    ["options"] = options;
                              });
                            },
                          );
                        }).toList(),
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: TextButton(
                            onPressed: () async {
                              if (surveyNameController.text.isEmpty == false &&
                                  descriptionController.text.isEmpty == false) {
                                var name = surveyNameController.text;
                                var description = descriptionController.text;
                                var survey = {
                                  "name": name,
                                  "description": description,
                                  "questions": this.questions
                                };
                                ApiController apiController = ApiController();
                                await apiController.createSurvey(survey);
                              }
                            },
                            child: ContainerGradientBorder(
                              width: size.width * 0.4,
                              height: 50,
                              gradient: LinearGradient(colors: [
                                Colors.blueAccent,
                                Colors.cyanAccent
                              ]),
                              intColor: Colors.white,
                              borderRadius: 10.0,
                              child: Center(
                                  child: Text(
                                "Save",
                                style: TextStyle(
                                    color: BaseColor.primary, fontSize: 14),
                              )),
                            ),
                          )),
                      Expanded(
                          flex: 4,
                          child: TextButton(
                            onPressed: () {},
                            child: ContainerGradientBorder(
                              width: size.width * 0.4,
                              height: 50,
                              gradient: LinearGradient(colors: [
                                Colors.blueAccent,
                                Colors.cyanAccent
                              ]),
                              intColor: Colors.white,
                              borderRadius: 10.0,
                              child: Center(
                                  child: Text(
                                "Save and create an event",
                                style: TextStyle(
                                    color: BaseColor.primary, fontSize: 14),
                              )),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
