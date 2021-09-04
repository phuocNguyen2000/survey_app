import 'package:equatable/equatable.dart';
import 'package:survey_app/api/response.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState {}

class UnAuthenticated extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final DataResponse<String> token;

  Authenticated({required this.token});

  @override
  List<Object> get props => [token];
}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  AuthenticationFailure({required this.message});

  @override
  List<Object> get props => [message];
}
