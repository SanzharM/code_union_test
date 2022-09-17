part of 'authorization_bloc.dart';

@immutable
abstract class AuthorizationState {}

class AuthorizationInitial extends AuthorizationState {
  final LoginCredentials credentials;
  AuthorizationInitial(this.credentials);
}

class LoginErrorState extends AuthorizationState {
  final String error;
  LoginErrorState(this.error);
}

class LoginLoadingState extends AuthorizationState {}

class LoginSuccessState extends AuthorizationState {}

class RegistrationErrorState extends AuthorizationState {
  final String error;
  RegistrationErrorState(this.error);
}

class RegistrationLoadingState extends AuthorizationState {}

class RegistrationSuccessState extends AuthorizationState {}

class LoginCredentailsUpdatedState extends AuthorizationState {
  final LoginCredentials updatedValue;
  LoginCredentailsUpdatedState(this.updatedValue);
}
