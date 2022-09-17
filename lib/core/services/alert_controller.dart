import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertController {
  static void showMessage({
    required BuildContext context,
    required String title,
    required String content,
    bool barrierDismissable = true,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
  }) async {
    if (Platform.isIOS || Platform.isMacOS) {
      await showCupertinoDialog(
        context: context,
        barrierDismissible: barrierDismissable,
        builder: (_) => CupertinoAlertDialog(
          title: Text(
            title,
            style: titleStyle ?? Theme.of(context).textTheme.titleMedium,
          ),
          content: Text(
            content,
            style: contentStyle ?? Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      );
    }
    await showDialog(
      context: context,
      barrierDismissible: barrierDismissable,
      builder: (_) => AlertDialog(
        title: Text(
          title,
          style: titleStyle ?? Theme.of(context).textTheme.titleMedium,
        ),
        content: Text(
          content,
          style: contentStyle ?? Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
