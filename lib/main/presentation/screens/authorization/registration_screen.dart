import 'package:code_union_test/core/constants/constants.dart';
import 'package:code_union_test/core/services/alert_controller.dart';
import 'package:code_union_test/main/domain/blocs/authorization/authorization_bloc.dart';
import 'package:code_union_test/main/domain/models/authorization/registration_credentials.dart';
import 'package:code_union_test/main/presentation/widgets/app_text_field.dart';
import 'package:code_union_test/main/presentation/widgets/buttons/app_button.dart';
import 'package:code_union_test/main/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  RegistrationCredentials _credentials = const RegistrationCredentials();
  late AuthorizationBloc bloc;

  @override
  void initState() {
    bloc = context.read<AuthorizationBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Регистрация',
        automaticallyImplyLeading: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 32.0),
        padding: const EdgeInsets.symmetric(horizontal: AppConstraints.padding),
        color: AppColors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(
              label: 'Логин',
              text: _credentials.nickname,
            ),
            AppTextField(
              label: 'Телефон',
              text: _credentials.phone,
            ),
            AppTextField(
              label: 'Почта',
              text: _credentials.email,
            ),
            AppTextField(
              label: 'Пароль',
              text: _credentials.password,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: BlocConsumer<AuthorizationBloc, AuthorizationState>(
        bloc: bloc,
        listener: (context, state) {
          print('state is $state');
          if (state is RegistrationErrorState) {
            AlertController.showMessage(context: context, title: 'Ошибка', content: state.error);
          }
          if (state is RegistrationSuccessState) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          final isLoading = state is RegistrationLoadingState;
          return Container(
            height: 64.0,
            margin: const EdgeInsets.all(AppConstraints.padding),
            child: AppButton(
              title: 'Создать аккаунт',
              isLoading: isLoading,
              onPressed: () {
                if (isLoading) return;
                bloc.registration(_credentials);
              },
            ),
          );
        },
      ),
    );
  }
}
