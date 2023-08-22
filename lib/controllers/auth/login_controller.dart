import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/repository/apidata.dart';
import 'package:task/routes/app_routes.dart';
import 'package:task/utils/widgets/snackbar.dart';

class LoginController extends GetxController {
  bool isLoading = true;

  final formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isRemeber = true;
  bool isPasswordShown = true;

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

  Future<void> login() async {
    try {
      isLoading = true;
      update();
      var res = await Dio().post(ApiData.baseUrl + ApiData.login, data: {
        "email": email.text,
        "password": password.text,
      });
      var data = res.data;
      print("Data $data");
      if (res.statusCode!.toInt() >= 200 &&
          res.statusCode!.toInt() <= 300 &&
          data['status'].toString() == 'true') {
        isLoading = false;
        update();
        Get.toNamed(
          Routes.pinRoutes,
          arguments: {'userid': data['data']['user_id']},
        );

        // data['data']['flights'].forEach((e) {
        //   filghtBookingList.add(ETickets.fromJson(e));
        // });
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
