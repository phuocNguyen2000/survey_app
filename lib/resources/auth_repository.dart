import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:survey_app/api/response.dart';
import 'package:survey_app/controllers/api_controller.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_html/html.dart';

class AuthRepository {
  ApiController apiController = ApiController();
  Future<String> fetchToken() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    String token = '';
    Map<String, String> all;
    if (kIsWeb) {
      all = window.localStorage;
    } else {
      all = await storage.readAll();
    }
    for (var st in all.entries) {
      if (st.key == 'token') {
        token = st.value;
      }
    }

    return token;
  }

  Future<void> persistUser(value) async {
    const FlutterSecureStorage storage = FlutterSecureStorage();

    try {
      if (kIsWeb) {
        window.localStorage['token'] = value;
      } else {
        await storage.write(key: "token", value: value);
      }
    } on Exception catch (e) {
      print('custom exception is been obtained');
    }
  }

  Future<DataResponse<String>> signIn(String email, String password) async {
    var response;
    try {
      response = await apiController.signIn(email, password);
    } catch (e) {
      response = {"error": e.toString()};
    }
    if (response == null) {
      return DataResponse.connectivityError();
    }
    if (response["error"] == null) {
      final String token = response["token"];
      await persistUser(token);
      var a = await fetchToken();
      print(a);
      return DataResponse.success(token);
    } else {
      return DataResponse.error(response["error"]);
    }
  }

  Future<DataResponse<String>> currentUser() async {
    var response;
    try {
      response = await apiController.currentUser();
    } catch (e) {
      response = {"error": e.toString()};
    }
    if (response == null) {
      return DataResponse.connectivityError();
    }
    if (response["error"] == null) {
      var data = response;
      return DataResponse.success(data);
    } else {
      return DataResponse.error(response["error"]);
    }
  }
}
