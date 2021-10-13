import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_app/base_color.dart';

import 'package:survey_app/controllers/login/login_controller.dart';
import 'package:survey_app/controllers/login/login_state.dart';
import 'package:survey_app/generated/l10n.dart';

import 'package:survey_app/screens/sign_up_screen.dart';
import 'package:survey_app/services/hex_color.dart';
import 'package:survey_app/widgets/container_gradient_border.dart';
import 'package:survey_app/widgets/gradien_mark.dart';
import 'package:survey_app/widgets/login_background.dart';
import 'package:survey_app/widgets/s_image64.dart';
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
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  @override
  void initState() {
    // TODO: implement initState
    emailController.text = "tranthiyen@gmail.com";
    passwordController.text = "lochixa411";
    _tapGestureRecognizer.onTap = () async {
      Get.toNamed("/signUp");
    };
    super.initState();
  }

  void _login() async {
    _controller.login(emailController.text, passwordController.text);
  }

  // final _channel = WebSocketChannel.connect(
  //   Uri.parse('ws://127.0.0.1:5000/echo'),
  // );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            LoginBackground(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // StreamBuilder(
                  //   stream: _channel.stream,
                  //   builder: (context, snapshot) {
                  //     _channel.sink.add(passwordController.text);
                  //     print(snapshot.data);
                  //     return Text(snapshot.hasData ? '${snapshot.data}' : '');
                  //   },
                  // ),
                  SImage64.imageFromBase64String(SImage64.logo100),
                  SizedBox(height: 100),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
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
                            gradient: LinearGradient(colors: [
                              HexColor("#ef6da0"),
                              HexColor("#ee8e6b")
                            ]),
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
                      ],
                    ),
                  ),
                  SizedBox(height: 50.0),
                  GestureDetector(
                      onTap: _controller.state is LoginLoading
                          ? () {}
                          : () async {
                              _login();
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
                          style:
                              TextStyle(color: BaseColor.primary, fontSize: 25),
                        )),
                      )),
                  GradientMark(
                      RichText(
                          text: TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(color: Colors.black),
                              children: [
                            TextSpan(
                                text: "Create an account",
                                recognizer: _tapGestureRecognizer,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white))
                          ])),
                      gradient: LinearGradient(
                          colors: [Colors.blueAccent, Colors.cyanAccent])),
                  if (_controller.state is LoginFailure)
                    Text(
                      (_controller.state as LoginFailure).error,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.amber),
                    ),
                  if (_controller.state is LoginLoading)
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
