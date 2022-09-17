part of 'authorization_bloc.dart';

@immutable
abstract class AuthorizationEvent {}

class LoginEvent extends AuthorizationEvent {
  final LoginCredentials credentials;
  LoginEvent(this.credentials);
}

class RegistrationEvent extends AuthorizationEvent {
  final RegistrationCredentials credentials;
  RegistrationEvent(this.credentials);
}

class UpdateLoginCredentials extends AuthorizationEvent {
  final LoginCredentials newValue;
  UpdateLoginCredentials(this.newValue);
}
