import 'package:code_union_test/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'buttons/app_icon_button.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.centerTitle = false,
    this.leading,
    this.automaticallyImplyLeading = false,
    this.actions,
    this.overlayStyle,
  }) : super(key: key);

  final String? title;
  final bool centerTitle;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final SystemUiOverlayStyle? overlayStyle;

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: (title?.isNotEmpty ?? false)
          ? Text(
              title!,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          : null,
      centerTitle: centerTitle,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions,
      systemOverlayStyle: overlayStyle ?? SystemUiOverlayStyle.dark,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
