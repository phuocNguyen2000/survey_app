import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:survey_app/generated/l10n.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'custom_exception.dart';

class ApiProvider {
  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  Future<Map<String, dynamic>> post(String url, dynamic body,
      {String token = ''}) async {
    dynamic responseJson;
    try {
      final dynamic response =
          await http.post(Uri.parse(url), body: body, headers: {
        'content-type': 'application/json',
        "Access-Control_Allow_Origin": "*",
        "Authorization": "basic"
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
