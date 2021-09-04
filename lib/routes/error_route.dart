import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_app/generated/l10n.dart';

Route<dynamic> errorRoute() {
  return MaterialPageRoute<dynamic>(builder: (_) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Error'),
        // ),
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff0077cd), Color(0xff00ce2d)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Container(
                              child: Text(
                                S.current.error,
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff00ce2d)),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (Platform.isAndroid) {
                                SystemNavigator.pop();
                              } else if (Platform.isIOS) {
                                exit(0);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff00ce2d),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.error,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  S.current.close_app,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ])),
              ],
            ),
          ),
        ),
      ),
    ));
  });
}
