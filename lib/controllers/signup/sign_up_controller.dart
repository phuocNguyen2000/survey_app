// Sign Up Controllerimport 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:survey_app/api/custom_exception.dart';
import 'package:survey_app/controllers/api_controller.dart';
import 'package:survey_app/controllers/authenticate/authenticate_controller.dart';

import 'package:survey_app/controllers/signup/sign_up_state.dart';

class SignUpController extends GetxController {
  final _SignUpStateStream = SignUpState().obs;
  final AuthenticateController _authenticationController = Get.find();

  SignUpState get state => _SignUpStateStream.value;

  // ignore: non_constant_identifier_names
  void signUp(String email, String password, String? token, String userName,
      String base64) async {
    _SignUpStateStream.value = SignUpLoading();
    ApiController apiController = new ApiController();

    try {
      var response =
          await apiController.signUp(email, password, token, userName, base64);

      _SignUpStateStream.value = SignUpSuccess();
    } on CustomException catch (e) {
      _SignUpStateStream.value = SignUpFailure(error: e.toString());
    }
  }
}
