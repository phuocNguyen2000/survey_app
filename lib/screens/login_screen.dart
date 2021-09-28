import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_app/base_color.dart';
import 'package:survey_app/controllers/api_controller.dart';
import 'package:survey_app/controllers/authenticate/authenticate_controller.dart';
import 'package:survey_app/controllers/login/login_controller.dart';
import 'package:survey_app/generated/l10n.dart';
import 'package:survey_app/resources/auth_repository.dart';
import 'package:survey_app/screens/home_screen.dart';
import 'package:survey_app/screens/sign_up_screen.dart';
import 'package:survey_app/services/hex_color.dart';
import 'package:survey_app/widgets/container_gradient_border.dart';
import 'package:survey_app/widgets/gradien_mark.dart';
import 'package:survey_app/widgets/logo.dart';
import 'package:survey_app/widgets/s_text_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isObscure = true;
  final _controller = Get.put(LoginController());
  AuthenticateController authenticateController = Get.find();

  void _login() async {
    _controller.login(emailController.text, passwordController.text);
    // AuthRepository authRepository = new AuthRepository();

    // var s = await authRepository.signIn(
    //     emailController.text, passwordController.text);

    // print(s.status);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Logo(),
            SizedBox(height: 100),
            ContainerGradientBorder(
              width: size.width * 0.8,
              height: 50.0,
              intColor: Colors.white,
              borderRadius: 10.0,
              child: GradientMark(
                XTextField(
                  icon: Icons.email,
                  hintText: S.current.email_hint,
                  controller: emailController,
                ),
                gradient: LinearGradient(
                    colors: [HexColor("#ef6da0"), HexColor("#ee8e6b")]),
              ),
              gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.cyanAccent]),
            ),
            ContainerGradientBorder(
              width: size.width * 0.8,
              height: 50.0,
              intColor: Colors.white,
              borderRadius: 10.0,
              child: XTextField(
                icon: Icons.lock,
                hintText: S.current.password_hint,
                controller: passwordController,
              ),
              gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.cyanAccent]),
            ),
            SizedBox(height: 50.0),
            GestureDetector(
                onTap: () async {
                  // _login();
                  Get.to(HomeScreen());
                },
                child: ContainerGradientBorder(
                  width: size.width * 0.4,
                  height: 60,
                  gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.cyanAccent]),
                  intColor: Colors.white,
                  borderRadius: 10.0,
                  child: Center(
                      child: Text(
                    S.current.sign_in,
                    style: TextStyle(color: BaseColor.primary, fontSize: 25),
                  )),
                )),
            GestureDetector(
                onTap: () async {
                  Get.to(SignUpScreen());
                },
                child: ContainerGradientBorder(
                  width: size.width * 0.4,
                  height: 60,
                  gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.cyanAccent]),
                  intColor: Colors.white,
                  borderRadius: 10.0,
                  child: Center(
                      child: GradientMark(
                    Text(
                      S.current.sign_up,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    gradient: LinearGradient(
                        colors: [HexColor("#ef6da0"), HexColor("#ee8e6b")]),
                  )),
                )),
          ],
        ),
      ),
    );
  }
}
