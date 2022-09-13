import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String s, Color c) {
  Fluttertoast.showToast(
      msg: s,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: c,
      textColor: Colors.white);
}
