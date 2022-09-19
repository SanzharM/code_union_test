import 'package:flutter/material.dart';

class AppCell extends StatelessWidget {
  const AppCell({
    Key? key,
    required this.text,
    this.icon,
    this.textStyle,
    this.padding,
  }) : super(key: key);

  final String text;
  final Widget? icon;
  final TextStyle? textStyle;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(width: 8.0),
          ],
          Expanded(
            child: Text(
              text,
              style: textStyle ?? Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
