import 'package:flutter/material.dart';
import 'package:survey_app/widgets/survey_card.dart';

class HomeTabBody extends StatefulWidget {
  const HomeTabBody({Key? key}) : super(key: key);

  @override
  _HomeTabBodyState createState() => _HomeTabBodyState();
}

class _HomeTabBodyState extends State<HomeTabBody> {
  List<Widget> surveys = [
    SurveyCard(),
    SurveyCard(),
    SurveyCard(),
    SurveyCard()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: surveys,
      ),
    );
  }
}
