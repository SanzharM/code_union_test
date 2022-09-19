import 'package:code_union_test/main/domain/blocs/authorization/authorization_bloc.dart';
import 'package:code_union_test/main/presentation/screens/authorization/login_screen.dart';
import 'package:code_union_test/main/presentation/screens/authorization/registration_screen.dart';
import 'package:code_union_test/main/presentation/screens/nav_bar.dart';
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

  static void toMainPage(BuildContext context) {
    final route = MaterialPageRoute(builder: (_) => const NavBar());
    Navigator.of(context).pushAndRemoveUntil(route, (route) => route.isFirst);
  }

  static void toLogin(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => AuthorizationBloc(),
        child: const LoginScreen(),
      ),
    );
    Navigator.of(context).pushAndRemoveUntil(route, (route) => route.isFirst);
  }
}
