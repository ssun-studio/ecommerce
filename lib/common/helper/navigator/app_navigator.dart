import 'package:flutter/material.dart';

class AppNavigator {

  // Push replace page navigator function
  static void pushReplacement(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget)
    );
  }

  // Push page navigator function
  static void push(BuildContext context,Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget)
    );
  }

  // Push and Remove navigation page navigator function
  static void pushAndRemove(BuildContext context,Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false
    );
  }
}