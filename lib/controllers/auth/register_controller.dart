import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/repository/apidata.dart';
import 'package:task/utils/appcolors.dart';
import 'package:task/utils/widgets/snackbar.dart';

class RegisterController extends GetxController {
  bool isLoading = true;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController code = TextEditingController();

  final formkey = GlobalKey<FormState>();

  bool isRemeber = true;
  bool isPasswordShown = true;
  bool isPasswordShown1 = true;

  bool isPinCodeScreen = false;


  Map response = {};

  @override
  void onInit() {
    update();
    super.onInit();
  }

  @override
  void onReady() {
    isLoading = false;
    update();
    super.onReady();
  }


  bool validateAndSaveUser() {
    final form = formkey.currentState;
    form!.save();
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> registerAccount() async {
    try {
      isLoading = true;
      update();
      var res = await Dio().post(ApiData.baseUrl + ApiData.register, data: {
        "firstName": name.text.split(' ').first.isEmpty
            ? ''
            : name.text.split(' ').first,
        "lastName":
            name.text.split(' ').last.isEmpty ? '' : name.text.split(' ').last,
        "email": email.text,
        "phone": phonenumber.text,
        "password": password.text,
        "refer_user": ""
      });
      var data = res.data;
      print("data is $data");
      if (res.statusCode!.toInt() >= 200 &&
          res.statusCode!.toInt() <= 300 &&
          data['status'].toString() == 'true') {
        isLoading = false;
        update();
        Get.back();
        CommonSnackbar.getSnackbar(
            "Success",
            "Account created successfully",
            AppColor.primary);
        update();
      } else {
        isLoading = false;
        update();
        CommonSnackbar.getSnackbar("Error", "${data['message']}", Colors.red);
      }
    } on DioException catch (e) {
      var error = e.response!.data;
      if (kDebugMode) {
        print("Api Error $error");
      }
      CommonSnackbar.getSnackbar("Error", "${error['message']}", Colors.red);
      isLoading = false;
      update();
    }
  }
}
