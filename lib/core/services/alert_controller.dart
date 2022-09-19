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

  static void showDecisionDialog({
    required BuildContext context,
    required void Function() onYes,
    required void Function() onNo,
    bool barrierDismissable = true,
    required String title,
    TextStyle? titleStyle,
    String? content,
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
          content: (content?.isEmpty ?? true)
              ? null
              : Text(
                  content!,
                  style: contentStyle ?? Theme.of(context).textTheme.bodyMedium,
                ),
          actions: [
            CupertinoDialogAction(
              child: const Text('Да'),
              onPressed: onYes,
            ),
            CupertinoDialogAction(
              child: const Text('Нет'),
              onPressed: onNo,
            ),
          ],
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
        content: (content?.isEmpty ?? true)
            ? null
            : Text(
                content!,
                style: contentStyle ?? Theme.of(context).textTheme.bodyMedium,
              ),
        actions: [
          TextButton(
            onPressed: onNo,
            child: const Text('Нет'),
          ),
          TextButton(
            onPressed: onYes,
            child: const Text('Да'),
          ),
        ],
      ),
    );
  }
}
