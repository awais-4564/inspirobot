import 'package:flutter/material.dart';

import 'custom_loading.dart';

class MyDialog {
  // Info Snackbar
  static void info(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.blue.withOpacity(.7),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Success Snackbar
  static void success(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.green.withOpacity(.7),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Error Snackbar
  static void error(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.redAccent.withOpacity(.7),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Loading Dialog
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,  // Prevents dismissal by tapping outside
      context: context,
      builder: (BuildContext context) {
        return const Center(child: CustomLoading());
      },
    );
  }

  // Dismiss the loading dialog
  static void dismissLoadingDialog(BuildContext context) {
    Navigator.pop(context);  // Close the dialog
  }
}
