import 'package:bloc/bloc.dart';
import 'package:code_union_test/main/data/providers/authorization/authorization_provider.dart';
import 'package:code_union_test/main/domain/models/authorization/login_credentials.dart';
import 'package:code_union_test/main/domain/models/authorization/registration_credentials.dart';
import 'package:flutter/cupertino.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  void login(LoginCredentials credentials) => add(LoginEvent(credentials));
  void registration(RegistrationCredentials credentials) => add(RegistrationEvent(credentials));
  void updateLoginCredentials(LoginCredentials credentials) => add(UpdateLoginCredentials(credentials));

  final _provider = AuthorizationProvider();
  AuthorizationBloc() : super(AuthorizationInitial(const LoginCredentials())) {
    on<LoginEvent>(_login);
    on<RegistrationEvent>(_registration);
    on<UpdateLoginCredentials>(_updateLoginCredentials);
  }

  void _login(LoginEvent event, Emitter<AuthorizationState> emit) async {
    if (!event.credentials.isValid) {
      emit(LoginErrorState('Укажите логин и пароль для авторизации'));
      return;
    }
    emit(LoginLoadingState());
    try {
      final response = await _provider.login(event.credentials);
      if (response.isSuccess) {
        emit(LoginSuccessState());
        return;
      }
      emit(LoginErrorState(response.error ?? 'Что-то пошло не так'));
    } catch (e) {
      debugPrint('LoginEvent error: $e');
      emit(LoginErrorState('Что-то пошло не так'));
    }
  }

  void _registration(RegistrationEvent event, Emitter<AuthorizationState> emit) async {
    emit(LoginLoadingState());
    try {
      final response = await _provider.registration(event.credentials);
      if (response.isSuccess) {
        emit(RegistrationSuccessState());
        return;
      }
      emit(RegistrationErrorState(response.error ?? 'Что-то пошло не так'));
    } catch (e) {
      debugPrint('LoginEvent error: $e');
      emit(RegistrationErrorState('Что-то пошло не так'));
    }
  }

  void _updateLoginCredentials(UpdateLoginCredentials event, Emitter<AuthorizationState> emit) async {
    emit(AuthorizationInitial(event.newValue));
  }
}
