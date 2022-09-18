import 'package:code_union_test/core/local_storage/local_storage.dart';
import 'package:code_union_test/main/domain/blocs/authorization/authorization_bloc.dart';
import 'package:code_union_test/main/presentation/screens/authorization/login_screen.dart';
import 'package:code_union_test/main/presentation/screens/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Widget screen = BlocProvider<AuthorizationBloc>(
    create: (context) => AuthorizationBloc(),
    child: const LoginScreen(),
  );

  try {
    final hasToken = (await LocalStorage().getAccessToken().timeout(const Duration(seconds: 2))) != null;
    if (hasToken) {
      screen = const NavBar();
    }
  } catch (e) {
    debugPrint('Main.dart error: $e');
  }

  runApp(App(screen: screen));
}

class App extends StatelessWidget {
  const App({Key? key, required this.screen}) : super(key: key);

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ,
      home: screen,
    );
  }
}
