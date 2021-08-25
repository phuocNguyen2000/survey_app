import 'package:get/get.dart';

class AuthenticateController extends GetxController {
  var token = "".obs;
  void setToken(s) {
    this.token = s;
    update();
  }
}
