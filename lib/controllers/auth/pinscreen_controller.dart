import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task/repository/apidata.dart';
import 'package:task/routes/app_routes.dart';
import 'package:task/utils/appcolors.dart';
import 'package:task/utils/widgets/snackbar.dart';

class PinScreenController extends GetxController {
  bool isLoading = true;
  TextEditingController code = TextEditingController();

  final formkey = GlobalKey<FormState>();

  bool isPinCodeScreen = false;

  final storage = GetStorage();

  String id = '';

  @override
  void onInit() {
    print("Arr ${Get.arguments}");
    if (Get.arguments != null) {
      id = Get.arguments['userid'].toString();
      update();
    }
    update();
    super.onInit();
  }

  @override
  void onReady() {
    isLoading = false;
    update();
    super.onReady();
  }


  Future<void> verifyAccount() async {
    try {
      isLoading = true;
      update();
      var res = await Dio().post(ApiData.baseUrl + ApiData.otp, data: {
        "user_id": id,
        "otp": code.text,
        "app": "mobile",
        "device_type": "ios"
      });
      var data = res.data;
      if (res.statusCode!.toInt() >= 200 &&
          res.statusCode!.toInt() <= 300 &&
          data['status'].toString() == 'true') {
        await storage.write("token", data['data']['token']);
        isLoading = false;
        update();
        Get.offAllNamed(Routes.dashboardRoutes);
        CommonSnackbar.getSnackbar(
            "Success", "Account Verify successfully", AppColor.primary);

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
