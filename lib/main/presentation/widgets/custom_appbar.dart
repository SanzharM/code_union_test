import 'package:code_union_test/core/constants/app_colors.dart';
import 'package:code_union_test/main/presentation/app_router.dart';
import 'package:code_union_test/main/presentation/widgets/buttons/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.centerTitle = true,
    this.leading,
    this.automaticallyImplyLeading = false,
    this.needLeading = true,
    this.actions,
    this.overlayStyle,
  }) : super(key: key);

  final String? title;
  final bool centerTitle;
  final Widget? leading;
  final bool needLeading;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final SystemUiOverlayStyle? overlayStyle;

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      backgroundColor: AppColors.white,
      elevation: 0,
      title: (title?.isNotEmpty ?? false)
          ? Text(
              title!,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          : null,
      centerTitle: centerTitle,
      leading: needLeading
          ? leading ??
              AppIconButton(
                icon: const Icon(Icons.arrow_back_ios_new_sharp),
                onPressed: () => AppRouter.back(context),
              )
          : null,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions,
      systemOverlayStyle: overlayStyle ?? SystemUiOverlayStyle.dark,
    );
  }

  Widget? _getLeading() {}

  @override
  Size get preferredSize => AppBar().preferredSize;
}
