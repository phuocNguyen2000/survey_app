import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:survey_app/api/response.dart';
import 'package:survey_app/controllers/api_controller.dart';
import 'package:survey_app/controllers/authenticate/authenticate_controller.dart';

class HomeController extends GetxController {
  final AuthenticateController _authenticationController = Get.find();
  void signOut() async {
    _authenticationController.signOut();
  }

  Future<DataResponse<String>> ownSurvey() async {
    var response;
    ApiController apiController = new ApiController();
    try {
      response = await apiController.ownSurvey();
      print(response);
    } catch (e) {
      print(e);
      response = {"error": e.toString()};
    }
    if (response == null) {
      return DataResponse.connectivityError();
    }
    if (response["error"] == null) {
      var data = response;
      return DataResponse.success(jsonEncode(data));
    } else {
      return DataResponse.error(response["error"]);
    }
  }

  Future<DataResponse<String>> ownEvent() async {
    var response;
    ApiController apiController = new ApiController();
    try {
      response = await apiController.ownEvent();
      print(response);
    } catch (e) {
      print(e);
      response = {"error": e.toString()};
    }
    if (response == null) {
      return DataResponse.connectivityError();
    }
    if (response["error"] == null) {
      var data = response;
      return DataResponse.success(jsonEncode(data));
    } else {
      return DataResponse.error(response["error"]);
    }
  }

  Future<DataResponse<String>> currentUser() async {
    var response;
    ApiController apiController = new ApiController();
    try {
      response = await apiController.currentUser();
      print(response);
    } catch (e) {
      print(e);
      response = {"error": e.toString()};
    }
    if (response == null) {
      return DataResponse.connectivityError();
    }
    if (response["error"] == null) {
      var data = response;
      return DataResponse.success(jsonEncode(data));
    } else {
      return DataResponse.error(response["error"]);
    }
  }
}
