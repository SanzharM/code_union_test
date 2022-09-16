import 'package:code_union_test/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class HorizontalSepartor extends StatelessWidget {
  const HorizontalSepartor({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 1.0,
      decoration: BoxDecoration(color: color ?? AppColors.greyLight),
    );
  }
}

class VerticalSeparator extends StatelessWidget {
  const VerticalSeparator({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: 1.0,
      decoration: BoxDecoration(color: color ?? AppColors.greyLight),
    );
  }
}
