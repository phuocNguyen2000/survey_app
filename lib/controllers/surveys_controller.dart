import 'package:get/get.dart';
import 'package:survey_app/models/survey.dart';

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
