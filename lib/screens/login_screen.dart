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
            Text(
              "eSurvey",
              style: TextStyle(color: BaseColor.primary, fontSize: 50),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  prefixIcon: Icon(Icons.account_box_outlined,
                      color: BaseColor.primary),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: BaseColor.primary, width: 2),
                      borderRadius: BorderRadius.circular(24)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(24)),
                ),
              ),
              width: size.width * 0.8,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextField(
                controller: passwordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  prefixIcon: Icon(Icons.lock, color: BaseColor.primary),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: BaseColor.primary, width: 2),
                      borderRadius: BorderRadius.circular(24)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(24)),
                ),
              ),
              width: size.width * 0.8,
            ),
            GestureDetector(
                onTap: () async {
                  _login();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                      color: BaseColor.background,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: BaseColor.primary,
                          style: BorderStyle.solid,
                          width: 3)),
                  child: Center(
                      child: Text(
                    S.current.sign_in,
                    style: TextStyle(color: BaseColor.primary, fontSize: 25),
                  )),
                  width: size.width * 0.3,
                  height: 50,
                )),
            GestureDetector(
                onTap: () async {
                  Get.to(HomeScreen());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                      color: BaseColor.background,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: BaseColor.primary,
                          style: BorderStyle.solid,
                          width: 3)),
                  child: Center(
                      child: Text(
                    S.current.sign_up,
                    style: TextStyle(color: BaseColor.primary, fontSize: 25),
                  )),
                  width: size.width * 0.3,
                  height: 50,
                )),
          ],
        ),
      ),
    );
  }
}
