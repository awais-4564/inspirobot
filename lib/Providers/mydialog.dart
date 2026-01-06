import 'package:flutter/material.dart';

class MyDialog {
  //info
  static void info(BuildContext context, String msg) {
    _showSnackbar(context, msg, Colors.blue);
  }

  //success
  static void success(BuildContext context, String msg) {
    _showSnackbar(context, msg, Colors.green);
  }

  //error
  static void error(BuildContext context, String msg) {
    _showSnackbar(context, msg, Colors.redAccent);
  }

  //loading dialog
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
  }

  // Helper function to show snackbar
  static void _showSnackbar(BuildContext context, String msg, Color color) {
    final snackBar = SnackBar(
      content: Text(msg),
      backgroundColor: color.withOpacity(0.7),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
