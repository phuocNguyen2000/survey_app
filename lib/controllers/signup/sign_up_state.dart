// Sign Up Stateimport 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  const SignUpState();

  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpFailure extends SignUpState {
  final String error;

  const SignUpFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'SignUpFailure { error: $error }';
}
