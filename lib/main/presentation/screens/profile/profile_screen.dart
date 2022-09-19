import 'package:code_union_test/core/constants/app_colors.dart';
import 'package:code_union_test/core/constants/app_constraints.dart';
import 'package:code_union_test/core/services/alert_controller.dart';
import 'package:code_union_test/main/domain/blocs/profile/profile_bloc.dart';
import 'package:code_union_test/main/presentation/widgets/app_icon.dart';
import 'package:code_union_test/main/presentation/widgets/buttons/app_button.dart';
import 'package:code_union_test/main/presentation/widgets/custom_appbar.dart';
import 'package:code_union_test/main/presentation/widgets/custom_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<ProfileBloc>()..getProfile();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Профиль',
        centerTitle: true,
        needLeading: false,
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is ProfileErrorState) {
            AlertController.showMessage(context: context, title: 'Ошибка', content: state.error);
          }
        },
        builder: (context, state) {
          return CustomShimmer(
            isLoading: state is ProfileLoadingState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: AppConstraints.padding * 2),
                const Icon(CupertinoIcons.person_crop_circle, size: 96.0),
                Text(
                  state is ProfileLoadedState ? state.user.nickname ?? '' : '',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: AppConstraints.padding),
                Text(
                  state is ProfileLoadedState ? state.user.email ?? '' : '',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.apply(color: AppColors.greyDark),
                ),
                const SizedBox(height: AppConstraints.padding * 2),
                Container(
                  width: double.maxFinite,
                  decoration: const BoxDecoration(color: AppColors.white),
                  padding: const EdgeInsets.only(left: AppConstraints.padding / 2),
                  child: AppButton(
                    title: 'Выйти',
                    alignment: Alignment.centerLeft,
                    textStyle: Theme.of(context).textTheme.bodyMedium?.apply(color: AppColors.red),
                    backgroundColor: AppColors.transparent,
                    onPressed: () => bloc.logout(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
