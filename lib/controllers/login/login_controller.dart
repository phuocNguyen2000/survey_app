import 'package:get/get.dart';
import 'package:survey_app/api/custom_exception.dart';
import 'package:survey_app/controllers/authenticate/authenticate_controller.dart';
import 'package:survey_app/controllers/login/login_state.dart';

class LoginController extends GetxController {
  final AuthenticateController _authenticationController = Get.find();

  final _loginStateStream = LoginState().obs;

  LoginState get state => _loginStateStream.value;

  void login(String email, String password) async {
    _loginStateStream.value = LoginLoading();

    try {
      await _authenticationController.signIn(email, password);
      _loginStateStream.value = LoginState();
    } on CustomException catch (e) {
      _loginStateStream.value = LoginFailure(error: e.toString());
    }
  }
}
