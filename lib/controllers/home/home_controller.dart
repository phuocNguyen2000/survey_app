import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:survey_app/controllers/authenticate/authenticate_controller.dart';

class HomeController extends GetxController {
  final AuthenticateController _authenticationController = Get.find();

  void signOut() {
    _authenticationController.signOut();
  }
}
