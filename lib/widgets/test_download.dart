import 'package:flutter/material.dart';
import 'package:survey_app/controllers/api_controller.dart';

class TestDownload extends StatefulWidget {
  const TestDownload({Key? key}) : super(key: key);

  @override
  _TestDownloadState createState() => _TestDownloadState();
}

class _TestDownloadState extends State<TestDownload> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: TextButton(
          child: Text('Download'),
          onPressed: () async {
            ApiController apiController = new ApiController();
            var data = await apiController.dowloadEventData({"event_id": 1});
            print(data);
          },
        ),
      ),
    ));
  }
}
