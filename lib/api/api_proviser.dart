import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:survey_app/controllers/authenticate/authenticate_state.dart';
import 'package:survey_app/controllers/authenticate/authenticate_controller.dart';
import 'package:survey_app/generated/l10n.dart';
import 'package:survey_app/resources/auth_repository.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'custom_exception.dart';

class ApiProvider {
  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  AuthenticationState auth = Get.find();
  Future<Map<String, dynamic>> post(String url, dynamic body,
      {String token = ''}) async {
    dynamic responseJson;
    AuthRepository authRepository = AuthRepository();
    var token = await authRepository.fetchToken();

    try {
      final dynamic response =
          await http.post(Uri.parse(url), body: body, headers: {
        'content-type': 'application/json',
        "Access-Control_Allow_Origin": "*",
        "Authorization": "basic",
        "X-Authorization": token
      });
      print(response.headers);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException(S.current.domain_does_not_exist);
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final dynamic responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
