import 'package:code_union_test/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.isLoading = false,
    this.padding,
    this.alignment,
    this.textStyle,
    this.textColor,
    this.backgroundColor,
  }) : super(key: key);

  final String title;
  final void Function()? onPressed;
  final bool isLoading;

  final Alignment? alignment;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  final Color? textColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      color: backgroundColor ?? AppColors.blue,
      padding: EdgeInsets.zero,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Container(
          width: double.maxFinite,
          alignment: alignment ?? Alignment.center,
          padding: padding ?? const EdgeInsets.all(AppConstraints.padding),
          child: Text(
            title,
            style: textStyle ?? Theme.of(context).textTheme.bodyLarge?.apply(color: textColor ?? AppColors.white),
          ),
        ),
      ),
    );
  }
}
