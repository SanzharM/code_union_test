import 'package:code_union_test/core/constants/constants.dart';
import 'package:code_union_test/core/services/alert_controller.dart';
import 'package:code_union_test/main/domain/blocs/authorization/authorization_bloc.dart';
import 'package:code_union_test/main/domain/models/authorization/login_credentials.dart';
import 'package:code_union_test/main/presentation/app_router.dart';
import 'package:code_union_test/main/presentation/widgets/app_text_field.dart';
import 'package:code_union_test/main/presentation/widgets/buttons/app_button.dart';
import 'package:code_union_test/main/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginCredentials _credentials = const LoginCredentials();
  late AuthorizationBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<AuthorizationBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).hasFocus ? () => FocusScope.of(context).unfocus() : null,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Авторизация',
          centerTitle: true,
          needLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextField(
              label: 'Логин или почта',
              text: _credentials.login,
              onChanged: (value) => setState(() => _credentials = _credentials.copyWith(login: value)),
            ),
            AppTextField(
              label: 'Пароль',
              text: _credentials.password,
              onChanged: (value) => setState(() => _credentials = _credentials.copyWith(password: value)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  BlocConsumer<AuthorizationBloc, AuthorizationState>(
                    bloc: bloc,
                    listener: (context, state) {
                      if (state is LoginErrorState) {
                        debugPrint('LoginErrorState: ${state.error}');
                        AlertController.showMessage(
                          context: context,
                          title: 'Ошибка',
                          content: state.error,
                        );
                      }

                      if (state is LoginSuccessState) {
                        AppRouter.toMainPage(context);
                      }
                    },
                    builder: (context, state) {
                      final isLoading = state is LoginLoadingState;
                      return AppButton(
                        title: 'Войти',
                        isLoading: isLoading,
                        onPressed: () {
                          if (isLoading) return;
                          bloc.login(_credentials);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: AppConstraints.padding / 2),
                  AppButton(
                    title: 'Регистрация',
                    onPressed: () => AppRouter.toRegistration(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
