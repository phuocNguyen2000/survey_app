import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_app/base_color.dart';
import 'package:survey_app/controllers/api_controller.dart';
import 'package:survey_app/widgets/container_gradient_border.dart';

class EditEventScreen extends StatefulWidget {
  const EditEventScreen({Key? key}) : super(key: key);

  @override
  _EditEventScreenState createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  var ownSurveys = [
    {"id": 1, "name": "servey"},
    {"id": 2, "name": "servey2"}
  ];
  DateTime start = DateTime.now();
  DateTime end = DateTime.now();
  TextEditingController priceController = TextEditingController();
  TextEditingController giveawayController = TextEditingController();
  TextEditingController limitController = TextEditingController();
  int price = 0;
  int giveaway = 0;

  List tags = [
    {"id": 0, "selected": false, "content": "All"},
    {"id": 1, "selected": false, "content": "Thanh niên"},
    {"id": 2, "selected": false, "content": "Trung niên"},
    {"id": 3, "selected": false, "content": "Lão niên"},
    {"id": 4, "selected": false, "content": "Nam giới"},
    {"id": 5, "selected": false, "content": "Nữ giới"}
  ];
  var survey;
  List tagx = [];
  @override
  void initState() {
    this.setState(() {
      this.tagx = this.tags;
      this.survey = this.ownSurveys[0];
      this.giveawayController.text = "0";
      this.priceController.text = "0";
      this.limitController.text = "0";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 20.0,
                child: Text(
                  "Chose your survey",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Surveys'),
                  actions: <Widget>[
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 200.0,
                            height: 150.0,
                            child: ListView(
                              children: ownSurveys
                                  .map((e) => Container(
                                        child: Column(
                                          children: [
                                            FilterChip(
                                              selected: e["name"] ==
                                                  this.survey["name"],
                                              label: Text(e["name"].toString()),
                                              onSelected: (bool value) {
                                                this.setState(() {
                                                  this.survey = e;
                                                });
                                              },
                                            ),
                                            Divider(),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              child: ContainerGradientBorder(
                gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.cyanAccent]),
                height: 50.0,
                width: MediaQuery.of(context).size.width * 0.8,
                borderRadius: 10.0,
                child:
                    Center(child: Container(child: Text(this.survey["name"]))),
              ),
            ),
            Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 20.0,
                child: Text(
                  "Chose tags you want",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Divider(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: tagx
                    .map((e) => FilterChip(
                          label: Text(e["content"]),
                          selected: e["selected"],
                          onSelected: (bool value) {
                            this.setState(() {
                              if (e["content"] == "All") {
                                for (var tag in tagx) {
                                  e["selected"] = value;
                                  tagx[tagx.indexOf(tag)]["selected"] =
                                      e["selected"];
                                }
                              }
                              for (var tag in tagx) {
                                if (tag["id"] == e["id"]) {
                                  e["selected"] = value;
                                  tagx[tagx.indexOf(tag)] = e;
                                }
                              }
                            });
                          },
                        ))
                    .toList(),
              ),
            ),
            Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 20.0,
                child: Text(
                  "Chose time ranger",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                    flex: 4,
                    child: TextButton(
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Calendar'),
                          actions: <Widget>[
                            Center(
                              child: Column(
                                children: [
                                  Container(
                                    width: 200.0,
                                    height: 150.0,
                                    child: CalendarDatePicker(
                                        currentDate: start,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.utc(2010, 10, 16),
                                        lastDate: DateTime.utc(2030, 3, 14),
                                        onDateChanged: (date) {
                                          this.setState(() {
                                            this.start = date;
                                          });
                                          print(date);
                                        }),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      child: Text(start.day.toString() +
                          "/" +
                          start.month.toString() +
                          "/" +
                          start.year.toString()),
                    )),
                Expanded(
                    flex: 4,
                    child: TextButton(
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Calendar'),
                          actions: <Widget>[
                            Center(
                              child: Column(
                                children: [
                                  Container(
                                    width: 200,
                                    height: 150,
                                    child: CalendarDatePicker(
                                        currentDate: end,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.utc(2010, 10, 16),
                                        lastDate: DateTime.utc(2030, 3, 14),
                                        onDateChanged: (date) {
                                          this.setState(() {
                                            this.end = date;
                                          });
                                          print(date);
                                        }),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      child: Text(end.day.toString() +
                          "/" +
                          end.month.toString() +
                          "/" +
                          end.year.toString()),
                    ))
              ],
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 20.0,
                            child: Text(
                              "Gift",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        TextField(
                          onChanged: (text) {
                            this.setState(() {
                              if (text.isEmpty) {
                                priceController.text = "0";
                              } else {
                                priceController.text = text;
                              }
                              priceController.selection = TextSelection(
                                  baseOffset: text.length,
                                  extentOffset: text.length);
                            });
                          },
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 8),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: BaseColor.primary, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 20.0,
                            child: Text(
                              "Give Away",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        TextField(
                          onChanged: (text) {
                            this.setState(() {
                              if (text.isEmpty) {
                                giveawayController.text = "0";
                              } else {
                                giveawayController.text = text;
                              }
                              giveawayController.selection = TextSelection(
                                  baseOffset: text.length,
                                  extentOffset: text.length);
                            });
                          },
                          controller: giveawayController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 8),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: BaseColor.primary, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 20.0,
                            child: Text(
                              "Limit",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        TextField(
                          onChanged: (text) {
                            this.setState(() {
                              if (text.isEmpty) {
                                limitController.text = "0";
                              } else {
                                limitController.text = text;
                              }
                              limitController.selection = TextSelection(
                                  baseOffset: text.length,
                                  extentOffset: text.length);
                            });
                          },
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          controller: limitController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 8),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: BaseColor.primary, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )
                      ],
                    )),
              ],
            ),
            Divider(),
            GestureDetector(
                onTap: () async {
                  var event = {
                    "limit": int.parse(limitController.text),
                    "tags": tagx,
                    "start": start.toString(),
                    "end": end.toString(),
                    "total": (int.parse(priceController.text) +
                        int.parse(giveawayController.text) +
                        (int.parse(priceController.text) +
                                int.parse(giveawayController.text)) *
                            0.1 +
                        2000),
                    "price": int.parse(priceController.text),
                    "give_away": int.parse(giveawayController.text),
                    "survey": survey
                  };
                  ApiController apiController = ApiController();
                  var data = await apiController.createEvent(event);
                  print("data" + data.toString());
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
                    (int.parse(priceController.text) +
                                int.parse(giveawayController.text) +
                                (int.parse(priceController.text) +
                                        int.parse(giveawayController.text)) *
                                    0.1 +
                                2000)
                            .toString() +
                        " VND",
                    style: TextStyle(color: BaseColor.primary, fontSize: 25),
                  )),
                )),
          ],
        ),
      ),
    )));
  }
}
