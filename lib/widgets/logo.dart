import 'package:flutter/material.dart';
import 'package:survey_app/base_color.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "eSurvey",
      style: TextStyle(color: BaseColor.primary, fontSize: 50),
    );
  }
}
