import 'package:code_union_test/main/domain/blocs/authorization/authorization_bloc.dart';
import 'package:code_union_test/main/presentation/screens/authorization/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static void toRegistration(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => AuthorizationBloc(),
        child: const RegistrationScreen(),
      ),
    );
    Navigator.of(context).push(route);
  }
}
