import 'package:code_union_test/main/domain/models/login_credentials/login_credentials.dart';
import 'package:code_union_test/main/presentation/widgets/app_text_field.dart';
import 'package:code_union_test/main/presentation/widgets/buttons/app_button.dart';
import 'package:code_union_test/main/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginCredentials _credentials = const LoginCredentials();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Авторизация',
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextField(
            label: 'Логин или почта',
            text: _credentials.login,
          ),
          AppTextField(
            label: 'Пароль',
            text: _credentials.password,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AppButton(
                  title: 'Войти',
                  onPressed: () {},
                ),
                AppButton(
                  title: 'Регистрация',
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
