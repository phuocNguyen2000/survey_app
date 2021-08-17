import 'package:flutter/material.dart';
import 'package:survey_app/screens/login_screen.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:async/async.dart';
import 'package:camera/camera.dart';
import 'package:survey_app/screens/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:survey_app/services/push_notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var a = new PushNotificationsManager();
  await a.init();
  // Get a specific camera from the list of available cameras.
  runApp(MaterialApp(
    home: SigUpScreen(),
  ));
}
