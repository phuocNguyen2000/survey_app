import 'package:flutter/material.dart';

import 'package:survey_app/widgets/gradien_text.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientText(
      "eSurvey",
      gradient: LinearGradient(colors: [Colors.blueAccent, Colors.cyanAccent]),
      style: TextStyle(color: Colors.white, fontSize: 50),
    );
  }
}
