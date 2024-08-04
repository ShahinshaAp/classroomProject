import 'package:flutter/material.dart';

class GlobalErrorHandler {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showError(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}
