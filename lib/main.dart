import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:survey_app/controllers/authenticate/authenticate_service.dart';
import 'package:survey_app/controllers/authenticate/authenticate_state.dart';

import 'package:survey_app/routes/routes_generator.dart';

import 'package:survey_app/screens/do_survey_screen.dart';

import 'package:survey_app/screens/home_screen.dart';
import 'package:survey_app/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:survey_app/screens/my_event_screen.dart';
import 'package:survey_app/screens/my_join_event_screen.dart';
import 'package:survey_app/screens/my_survey_screen.dart';
import 'package:survey_app/screens/sign_up_screen.dart';

import 'package:survey_app/screens/splash_screen.dart';
import 'package:survey_app/screens/survey_question_edit_screen.dart';
import 'package:survey_app/widgets/edit_event_screen.dart';

import 'controllers/authenticate/authenticate_controller.dart';
import 'generated/l10n.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  print(message.data);
}

AndroidNotificationChannel? channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

RouteGenerator routeGenerator = RouteGenerator();
void initialize() async {
  Get.lazyPut(() => AuthenticateController(Get.put(FAuthenticateService())),
      fenix: true);
}

void main() async {
  InitialBinding().dependencies();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  String? token = await FirebaseMessaging.instance.getToken();
  print(token);
  // var a = new PushNotificationsManager();
  // await a.init();
  // Get a specific camera from the list of available cameras.

  runApp(App());
}

class App extends GetWidget<AuthenticateController> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        onInit: () {
          InitialBinding().dependencies();
        },
        getPages: [
          GetPage(name: '/', page: () => HomeScreen()),
          GetPage(name: '/login', page: () => LogInScreen()),
          GetPage(name: '/signUp', page: () => SignUpScreen()),
          GetPage(name: '/mySurveys', page: () => MySurveyScreen()),
          GetPage(
              name: '/createSurvey', page: () => SurveyQuestionEditScreen()),
          GetPage(name: '/createEvent', page: () => EditEventScreen()),
          GetPage(name: '/myEvents', page: () => MyEventScreen()),
          GetPage(name: '/joinEvents', page: () => MyJoinEventScreen()),
          GetPage(name: '/doSurvey', page: () => DoSurveyScreen()),
          GetPage(name: '/splash', page: () => SplashScreen())
        ],
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        initialBinding: InitialBinding(),
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeft,
        home: GetX<AuthenticateController>(
          init: AuthenticateController(Get.put(FAuthenticateService())),
          builder: (controller) {
            if (controller.state is UnAuthenticated ||
                controller.state is AuthenticationFailure) {
              return LogInScreen();
            }

            if (controller.state is Authenticated) {
              return HomeScreen();
            }
            return SplashScreen();
          },
        ));
  }
}

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticateController(Get.put(FAuthenticateService())),
        fenix: true);
  }
}
