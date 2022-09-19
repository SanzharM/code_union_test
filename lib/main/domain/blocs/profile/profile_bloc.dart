import 'package:bloc/bloc.dart';
import 'package:code_union_test/main/data/providers/profile/profile_provider.dart';
import 'package:code_union_test/main/domain/models/profile/user.dart';
import 'package:flutter/cupertino.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  void getProfile() => add(GetProfileEvent());
  void logout() => add(LogoutEvent());

  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfileEvent>(_getProfile);
    on<LogoutEvent>(_logout);
  }

  final _provider = ProfileProvider();

  void _getProfile(GetProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    try {
      final response = await _provider.getProfile();
      if (response.isSuccess) {
        emit(ProfileLoadedState(response.user!));
        return;
      }
      emit(ProfileErrorState(response.error ?? 'Что-то пошло не так'));
      return;
    } catch (e) {
      debugPrint('Profile bloc get profile error: $e');
      emit(ProfileErrorState('Что-то пошло не так'));
      return;
    }
  }

  void _logout(LogoutEvent event, Emitter<ProfileState> emit) async {
    try {
      _provider.storage.resetStorage();
      emit(LogoutSuccessState());
    } catch (e) {
      debugPrint('Profile bloc logout error: $e');
      emit(ProfileErrorState('Что-то пошло не так'));
    }
  }
}
