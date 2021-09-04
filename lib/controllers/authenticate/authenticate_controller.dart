import 'package:get/get.dart';
import 'package:survey_app/controllers/authenticate/authenticate_service.dart';
import 'package:survey_app/resources/auth_repository.dart';

import 'authenticate_state.dart';

class AuthenticateController extends GetxController {
  late AuthenticateService authenticateService;
  final _authenticationStateStream = AuthenticationState().obs;
  AuthRepository authRepository = new AuthRepository();
  AuthenticationState get state => _authenticationStateStream.value;
  @override
  void onInit() {
    _getAuthenticatedUser();
    super.onInit();
  }

  Future<void> signIn(String email, String password) async {
    final token =
        await authenticateService.signInWithEmailAndPassword(email, password);
    _authenticationStateStream.value = Authenticated(token: token);
  }

  void _getAuthenticatedUser() async {
    _authenticationStateStream.value = AuthenticationLoading();

    var token = await authRepository.test();

    if (token == null) {
      _authenticationStateStream.value = UnAuthenticated();
    } else {
      _authenticationStateStream.value = Authenticated(token: token);
    }
  }
}
