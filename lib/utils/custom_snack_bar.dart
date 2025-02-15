import 'package:flutter/material.dart';

class CustomSnackBar {
  static sucessSnackBar(
      {required BuildContext context, required String message}) {
    var snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.green),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static errorSnackBar(
      {required BuildContext context, required String message}) {
    var snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.red),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
