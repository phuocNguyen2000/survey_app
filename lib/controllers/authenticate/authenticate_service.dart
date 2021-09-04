import 'package:get/get.dart';
import 'package:survey_app/api/response.dart';
import 'package:survey_app/resources/auth_repository.dart';

abstract class AuthenticateService extends GetxService {
  Future<String?> getCurrentToken();
  Future<DataResponse<String>> signInWithEmailAndPassword(
      String email, String password);
  Future<void> signOut();
}

class FAuthenticateService extends AuthenticateService {
  AuthRepository authRepository = new AuthRepository();
  @override
  Future<String?> getCurrentToken() async {
    // simulated delay
    await Future.delayed(Duration(seconds: 2));
    return null;
  }

  @override
  Future<DataResponse<String>> signInWithEmailAndPassword(
      String email, String password) async {
    var token = await authRepository.signIn(email, password);

    return token;
  }

  @override
  Future<void> signOut() async {}
}

class AuthenticationException implements Exception {
  final String message;

  AuthenticationException({this.message = 'Unknown error occurred. '});
}
