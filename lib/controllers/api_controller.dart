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

  Future<Map<String, dynamic>> test() async {
    ApiProvider apiProvider = ApiProvider();
    try {
      final String data = json.encode({"email": "e", "password": "e"});
      return await apiProvider.post(baseUrl + '/test', data);
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
