import 'package:get/get.dart';
import 'package:survey_app/controllers/authenticate/authenticate_service.dart';
import 'package:survey_app/models/user.dart';
import 'package:survey_app/resources/auth_repository.dart';

import 'authentication.dart';

class AuthenticateController extends GetxController {
  final AuthenticateService authenticateService;
  final _authenticationStateStream = AuthenticationState().obs;
  AuthRepository authRepository = new AuthRepository();

  AuthenticationState get state => _authenticationStateStream.value;
  AuthenticateController(this.authenticateService);
  @override
  void onInit() async {
    Get.lazyPut(() => AuthenticationState());
    _getAuthenticatedUser();
    super.onInit();
  }

  Future<void> signIn(String email, String password) async {
    final data =
        await authenticateService.signInWithEmailAndPassword(email, password);
    User user = User(name: "curUs", email: data.data.toString());
    _authenticationStateStream.value = Authenticated(user: user);
  }

  void signOut() async {
    await authenticateService.signOut();
    _authenticationStateStream.value = UnAuthenticated();
  }

  void _getAuthenticatedUser() async {
    _authenticationStateStream.value = AuthenticationLoading();

    var data = await authenticateService.getCurrentToken();

    if (data == "") {
      print("data null");
      _authenticationStateStream.value = UnAuthenticated();
    } else {
      print("data ko null");
      User user = User(name: "curUs", email: data.toString());
      _authenticationStateStream.value = Authenticated(user: user);
    }
  }
}
