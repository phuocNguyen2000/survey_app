import 'package:get/get.dart';


class SurveysController extends GetxController {
  RxList surveys = [].obs;
  RxList owlSurveys = [].obs;
  RxList getSurveys() {
    return this.surveys;
  }

  RxList getOwlSurveys() {
    return this.owlSurveys;
  }
}
