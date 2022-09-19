part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileErrorState extends ProfileState {
  final String error;
  ProfileErrorState(this.error);
}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final User user;
  ProfileLoadedState(this.user);
}

class LogoutSuccessState extends ProfileState {}
