import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:survey_app/enum/question_type.dart';
import 'package:survey_app/widgets/s_text_field.dart';

class EdtQuestionLayout extends StatefulWidget {
  const EdtQuestionLayout(
      {Key? key,
      this.element,
      this.addoption,
      this.options,
      this.changeoption,
      this.changequestion,
      this.setType,
      this.allowDifferentAnswer})
      : super(key: key);
  final element;
  final addoption;
  final options;
  final changeoption;
  final changequestion;
  final setType;
  final allowDifferentAnswer;

  @override
  _EdtQuestionLayoutState createState() => _EdtQuestionLayoutState();
}

class _EdtQuestionLayoutState extends State<EdtQuestionLayout> {
  TextEditingController textEditingController = TextEditingController();
  QuestionTypes questionTypes = QuestionTypes.Checkbox;
  List<Row> options = [];
  List optionsx = [];
  bool allowDifferentAnswer = false;
  @override
  void initState() {
    this.textEditingController.text = widget.element["content"];
    print(widget.element["options"]);
    setState(() {
      this.optionsx = widget.element["options"];
      widget.element["type"] == 0
          ? this.questionTypes = QuestionTypes.Checkbox
          : this.questionTypes = QuestionTypes.Radio;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: new BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: XTextField(
                    onchange: (text) {
                      widget.changequestion(text, widget.element["id"]);
                    },
                    icon: Icons.help_center_sharp,
                    hintText: "Add your question",
                    controller: textEditingController,
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Center(
                        child: IconButton(
                            onPressed: widget.addoption,
                            icon: Icon(Icons.add_box)))),
                Expanded(
                    flex: 1,
                    child: Center(
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (this.questionTypes ==
                                    QuestionTypes.Checkbox) {
                                  this.questionTypes = QuestionTypes.Radio;
                                } else {
                                  this.questionTypes = QuestionTypes.Checkbox;
                                }
                                widget.setType(
                                    widget.element["id"], this.questionTypes);
                              });
                            },
                            icon: Icon(questionTypes == QuestionTypes.Checkbox
                                ? Icons.check_box_outline_blank_outlined
                                : Icons.lens_outlined)))),
                Expanded(
                    flex: 1,
                    child: Center(
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.dangerous))))
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  this.allowDifferentAnswer == true
                      ? this.allowDifferentAnswer = false
                      : this.allowDifferentAnswer = true;
                });
                widget.allowDifferentAnswer(
                    widget.element["id"], this.allowDifferentAnswer);
              },
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.adjust_rounded,
                        color:
                            allowDifferentAnswer ? Colors.green : Colors.grey,
                      )),
                  Expanded(flex: 6, child: Text("Allow different answer"))
                ],
              ),
            ),
            ConstrainedBox(
              constraints: new BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 2,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Column(
                        children: List.from(jsonDecode(
                                jsonEncode(widget.element["options"])))
                            .map((e) {
                      TextEditingController ct =
                          TextEditingController(text: e["content"]);
                      return Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: XTextField(
                              onchange: (text) {
                                widget.changeoption(text, e["id"]);
                              },
                              icon: questionTypes == QuestionTypes.Checkbox
                                  ? Icons.check_box_outline_blank_outlined
                                  : Icons.lens_outlined,
                              hintText: "Add your option",
                              controller: ct,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    this.optionsx.length > 0
                                        ? this
                                            .optionsx
                                            .removeAt(this.optionsx.indexOf(e))
                                        : print("");
                                  });
                                },
                                icon: Icon(Icons.delete)),
                          )
                        ],
                      );
                    }).toList()),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
