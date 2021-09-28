import 'package:flutter/material.dart';
import 'package:survey_app/base_color.dart';

class SurveyCard extends StatefulWidget {
  const SurveyCard({Key? key}) : super(key: key);

  @override
  _SurveyCardState createState() => _SurveyCardState();
}

class _SurveyCardState extends State<SurveyCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: BaseColor.background,
        borderRadius: BorderRadius.circular(10),
      ),
      width: size.width * 0.1,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.arrow_drop_down_circle),
              title: const Text('Card title 1'),
              subtitle: Text(
                'Secondary Text',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Icon(Icons.icecream),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                FlatButton(
                  onPressed: () {
                    // Perform some action
                  },
                  child: const Text('ACTION 1'),
                ),
                FlatButton(
                  onPressed: () {
                    // Perform some action
                  },
                  child: const Text('ACTION 2'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
