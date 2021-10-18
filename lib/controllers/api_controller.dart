import 'dart:convert';

import 'package:survey_app/api/api_proviser.dart';
import 'package:survey_app/env.dart';

class ApiController {
  final String baseUrl = Env.baseUrl;
  Future<Map<String, dynamic>> signIn(String email, String password) async {
    ApiProvider apiProvider = ApiProvider();
    try {
      final String data = json.encode({"email": email, "password": password});
      return await apiProvider.post(baseUrl + '/signIn', data);
    } on Error catch (e) {
      throw Exception('Failed to load post ' + e.toString());
    }
  }

  Future<Map<String, dynamic>> currentUser() async {
    ApiProvider apiProvider = ApiProvider();
    try {
      final String data = json.encode({"email": "e", "password": "e"});
      return await apiProvider.post(baseUrl + '/currentUser', data);
    } on Error catch (e) {
      throw Exception('Failed to load post ' + e.toString());
    }
  }

  Future<Map<String, dynamic>> ownSurvey() async {
    ApiProvider apiProvider = ApiProvider();
    try {
      final String data = json.encode({"email": "e", "password": "e"});

      return await apiProvider.post(baseUrl + '/ownSurvey', data);
    } on Error catch (e) {
      throw Exception('Failed to load post ' + e.toString());
    }
  }

  Future<Map<String, dynamic>> joinEvent() async {
    ApiProvider apiProvider = ApiProvider();
    try {
      final String data = json.encode({"email": "e", "password": "e"});

      return await apiProvider.post(baseUrl + '/joinEvent', data);
    } on Error catch (e) {
      throw Exception('Failed to load post ' + e.toString());
    }
  }

  Future<Map<String, dynamic>> ownEvent() async {
    ApiProvider apiProvider = ApiProvider();
    try {
      final String data = json.encode({"email": "e", "password": "e"});

      return await apiProvider.post(baseUrl + '/ownEvent', data);
    } on Error catch (e) {
      throw Exception('Failed to load post ' + e.toString());
    }
  }

  Future<Map<String, dynamic>> createSurvey(dynamic survey) async {
    ApiProvider apiProvider = ApiProvider();
    try {
      final String data = json.encode(survey);

      return await apiProvider.post(baseUrl + '/createSurvey', data);
    } on Error catch (e) {
      throw Exception('Failed to load post ' + e.toString());
    }
  }

  Future<Map<String, dynamic>> editSurvey(dynamic survey) async {
    ApiProvider apiProvider = ApiProvider();
    try {
      final String data = json.encode(survey);

      return await apiProvider.post(baseUrl + '/editSurvey', data);
    } on Error catch (e) {
      throw Exception('Failed to load post ' + e.toString());
    }
  }

  Future<Map<String, dynamic>> createEvent(dynamic event) async {
    ApiProvider apiProvider = ApiProvider();
    try {
      final String data = json.encode(event);

      return await apiProvider.post(baseUrl + '/createEvent', data);
    } on Error catch (e) {
      throw Exception('Failed to load post ' + e.toString());
    }
  }

  Future<Map<String, dynamic>> doSurvey(dynamic event) async {
    ApiProvider apiProvider = ApiProvider();
    try {
      final String data = json.encode(event);

      return await apiProvider.post(baseUrl + '/doSurvey', data);
    } on Error catch (e) {
      throw Exception('Failed to load post ' + e.toString());
    }
  }

  Future<Map<String, dynamic>> signUp(String email, String password,
      String? device_key, String userName, String image64) async {
    ApiProvider apiProvider = ApiProvider();
    try {
      final String data = json.encode({
        "email": email,
        "device_key": device_key,
        "password": password,
        "user_name": userName,
        "image64": image64
      });

      return await apiProvider.post(baseUrl + '/signUp', data);
    } on Error catch (e) {
      throw Exception('Failed to load post ' + e.toString());
    }
  }
}
