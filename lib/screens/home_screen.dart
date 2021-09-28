import 'package:flutter/material.dart';
import 'package:survey_app/widgets/event_tab_body.dart';
import 'package:survey_app/widgets/home_tab_body.dart';
import 'package:survey_app/widgets/survey_card.dart';
import 'package:survey_app/widgets/survey_tab_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 55,
                  height: 45,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blueAccent, Colors.cyanAccent]),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.redAccent),
                  child: Icon(Icons.account_box),
                ),
              )
            ],
          ),
          body: TabBarView(
              children: [HomeTabBody(), SurveyTabBody(), EventTabBody()]),
          bottomNavigationBar: TabBar(
              unselectedLabelColor: Colors.redAccent,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.cyanAccent]),
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.redAccent),
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("HOME"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("SURVEY"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("EVENT"),
                  ),
                ),
              ]),
        ));
  }
}
