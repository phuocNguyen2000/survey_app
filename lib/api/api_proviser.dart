import 'package:crypto/crypto.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import 'package:survey_app/controllers/authenticate/authenticate_state.dart';

import 'package:survey_app/generated/l10n.dart';
import 'package:survey_app/resources/auth_repository.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'custom_exception.dart';
// import 'dart:js' as js;
// import 'dart:html' as html;
import 'package:flutter/foundation.dart' show kIsWeb;

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

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException(S.current.domain_does_not_exist);
    }
    return responseJson;
  }

  Future<Map<String, dynamic>> postDown(String url, dynamic body,
      {String token = ''}) async {
    dynamic responseJson;
    AuthRepository authRepository = AuthRepository();
    var token = await authRepository.fetchToken();

    try {
      final response = await http.post(Uri.parse(url), body: body, headers: {
        'content-type': 'application/json',
        "Access-Control_Allow_Origin": "*",
        "Authorization": "basic",
        "X-Authorization": token
      });

      if (kIsWeb) {
        // final script =
        //     html.document.createElement('script') as html.ScriptElement;
        // script.src = "http://cdn.jsdelivr.net/g/filesaver.js";
        // final bytes = utf8.encode(response.body);
        // html.document.body?.nodes.add(script);

        // js.context.callMethod("saveAs", [
        //   html.Blob([bytes]),
        //   "mycsv.csv",
        //   "text/csv;charset=utf-8"
        // ]);

        // // cleanup
        // html.document.body!.nodes.remove(script);
      } else {
        List<Directory>? appDocDirectory = await getExternalStorageDirectories(
            type: StorageDirectory.downloads);
        print(appDocDirectory!.length);
        var directory =
            await new Directory(appDocDirectory[0].path + '/' + 'dir')
                .create(recursive: true)
// The created directory is returned as a Future.
                .then((Directory directory) {
          print('Path of New Dir: ' + directory.path);
          var path = directory.path;
          var x = File('$path/fileName.csv');
          var data = response.body;
          print(data);

          x.writeAsStringSync(data);
        });
      }
    } on SocketException {
      throw FetchDataException(S.current.domain_does_not_exist);
    }
    return responseJson;
  }

  Future<File> writeCSV(String csv, String fileName) async {
    final file = await _localFile(fileName);

    // Write the file
    return file.writeAsString('$csv');
  }

  Future<File> _localFile(String fileName) async {
    final path = await _localPath;
    return File('/storage/emulated/0/Download/$fileName.csv');
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
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
