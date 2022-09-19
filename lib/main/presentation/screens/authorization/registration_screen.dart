import 'package:code_union_test/core/constants/constants.dart';
import 'package:code_union_test/core/services/alert_controller.dart';
import 'package:code_union_test/main/domain/blocs/authorization/authorization_bloc.dart';
import 'package:code_union_test/main/domain/models/authorization/registration_credentials.dart';
import 'package:code_union_test/main/presentation/app_router.dart';
import 'package:code_union_test/main/presentation/widgets/app_text_field.dart';
import 'package:code_union_test/main/presentation/widgets/buttons/app_button.dart';
import 'package:code_union_test/main/presentation/widgets/buttons/app_icon_button.dart';
import 'package:code_union_test/main/presentation/widgets/custom_appbar.dart';
import 'package:code_union_test/main/presentation/widgets/separator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  RegistrationCredentials _credentials = const RegistrationCredentials();
  late AuthorizationBloc bloc;

  bool isObscured = true;

  @override
  void initState() {
    bloc = context.read<AuthorizationBloc>();
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).hasFocus ? () => FocusScope.of(context).unfocus() : null,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Регистрация',
          automaticallyImplyLeading: true,
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 32.0),
          padding: const EdgeInsets.symmetric(horizontal: AppConstraints.padding),
          color: AppColors.white,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  label: 'Логин',
                  text: _credentials.nickname,
                  onChanged: (value) => setState(() => _credentials = _credentials.copyWith(nickname: value)),
                  needValidator: true,
                ),
                const HorizontalSepartor(padding: EdgeInsets.symmetric(horizontal: AppConstraints.padding)),
                AppTextField(
                  label: 'Телефон',
                  text: _credentials.phone,
                  onChanged: (value) => setState(() => _credentials = _credentials.copyWith(phone: value)),
                  needValidator: true,
                ),
                const HorizontalSepartor(padding: EdgeInsets.symmetric(horizontal: AppConstraints.padding)),
                AppTextField(
                  label: 'Почта',
                  text: _credentials.email,
                  onChanged: (value) => setState(() => _credentials = _credentials.copyWith(email: value)),
                  needValidator: true,
                ),
                const HorizontalSepartor(padding: EdgeInsets.symmetric(horizontal: AppConstraints.padding)),
                AppTextField(
                  label: 'Пароль',
                  text: _credentials.password,
                  maxLines: 1,
                  isObscured: isObscured,
                  icon: AppIconButton(
                    icon: Icon(
                      isObscured ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                      size: 22.0,
                      color: AppColors.black,
                    ),
                    onPressed: () => setState(() => isObscured = !isObscured),
                  ),
                  onChanged: (value) => setState(() => _credentials = _credentials.copyWith(password: value)),
                  needValidator: true,
                ),
              ],
            ),
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
              AppRouter.back(context);
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
                  _formKey.currentState?.validate();
                  bloc.registration(_credentials);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
