import 'package:flutter/material.dart';


class NotificationsService {
  static late GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {
    final snackBar = SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      behavior: SnackBarBehavior.floating,
      //elevation: 10,
      backgroundColor: Colors.grey.shade800,
      content: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }
}

