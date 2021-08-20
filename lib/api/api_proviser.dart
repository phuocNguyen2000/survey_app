import 'package:http/http.dart' as http;
import 'package:survey_app/generated/l10n.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'custom_exception.dart';

class ApiProvider {
  Future<Map<String, dynamic>> post(String url, dynamic body,
      {String token = ''}) async {
    dynamic responseJson;
    try {
      final dynamic response =
          await http.post(Uri.parse(Uri.encodeFull(url)), body: body, headers: {
        'content-type': 'Application/Json',
        "Access-Control_Allow_Origin": "*",
        'authorization': 'Bearer ' + token,
        'cookie': 'session_id=' + token
      });
      String cookie =
          response.headers['set-cookie'].toString().split(";").first.toString();
      final String sessionId = cookie.split("session_id=").last.toString();
      responseJson = _response(response);
      // final result = jsonDecode(response)['result'];
      // final String displayName = result('name');

      responseJson["session_id"] = sessionId;
      // responseJson['name'] = displayName;
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
