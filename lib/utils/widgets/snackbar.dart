
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonSnackbar
{
  static void getSnackbar(String title, String message, Color snackbarColor) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: snackbarColor,
    );
  }
}
