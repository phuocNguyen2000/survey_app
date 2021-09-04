import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_app/api/response.dart';
import 'package:survey_app/resources/auth_repository.dart';
import 'package:survey_app/screens/home_screen.dart';
import 'package:survey_app/screens/login_screen.dart';
import 'package:survey_app/screens/sign_up_screen.dart';

import 'error_route.dart';
import 'routes.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class RouteGenerator {
  AuthRepository authRepository = new AuthRepository();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // UserRepository userRepository = new UserRepository();

    print(settings.arguments);
    switch (settings.name) {
      case Routes.signIn:
        return _createRoute(LogInScreen());
      case Routes.signUp:
        return MaterialPageRoute<dynamic>(builder: (_) => SignUpScreen());
      case Routes.home:
        return _createRoute(HomeScreen());

      default:
        return errorRoute();
    }
  }
}

Route _createRoute(Widget widget) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            new Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 800));
}
