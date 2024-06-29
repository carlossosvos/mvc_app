import 'package:flutter/material.dart';
import 'package:mvc_app/widgets/custom_alert_dialog.dart';
import 'package:mvc_app/widgets/error_dialog.dart';

void showCustomDialog(
  BuildContext context,
  String title,
  String content, {
  String confirmText = 'Confirm',
  String cancelText = 'Cancel',
  required VoidCallback onConfirm,
  required VoidCallback onCancel,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomAlertDialog(
        title: title,
        content: content,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
      );
    },
  );
}

void showErrorDialog(
  BuildContext context, {
  required String title,
  required String message,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return ErrorDialog(
        title: title,
        message: message,
      );
    },
  );
}
