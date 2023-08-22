import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  bool isLoading = true;

  List<Map<String, dynamic>> adultsFormList = [];
  List<Map<String, dynamic>> adultsList = [];

  List<Map<String, dynamic>> childFormList = [];
  List<Map<String, dynamic>> childList = [];

  final formkey = GlobalKey<FormState>();

  List genderList = [];

  Map dataList = {};

  @override
  void onInit() {
    if (Get.arguments != null) {
      addAdultsForm(int.parse(Get.arguments['adults']));
      addChildForm(int.parse(Get.arguments['child']));
    }
    genderList = [
      {"id": "select", "name": "select"},
      {"id": "Male", "name": "Male"},
      {"id": "Female", "name": "Female"},
    ];
    update();
    super.onInit();
  }

  @override
  void onReady() {
    isLoading = false;
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

  void addAdultsForm(int f) {
    for (int i = 0; i < f; i++) {
      adultsFormList.add(
        {
          "first_name": TextEditingController(),
          "last_name": TextEditingController(),
          "gender": TextEditingController(),
          "dateofbirth": TextEditingController(),
          "nationality": TextEditingController(),
          "mobile": TextEditingController(),
          "email": TextEditingController(),
          "passportNo": TextEditingController(),
        },
      );
    }
    update();
  }

  void addChildForm(int f) {
    for (int i = 0; i < f; i++) {
      childFormList.add(
        {
          "first_name": TextEditingController(),
          "last_name": TextEditingController(),
          "gender": TextEditingController(),
          "dateofbirth": TextEditingController(),
          "nationality": TextEditingController(),
          "mobile": TextEditingController(),
          "email": TextEditingController(),
          "passportNo": TextEditingController(),
        },
      );
    }
    update();
  }

  void setListData() {
    adultsList.clear();
    childList.clear();
    update();
    for (int i = 0; i < adultsFormList.length; i++) {
      adultsList.add(
        {
          "first_name": adultsFormList[i]['first_name'].text,
          "last_name": adultsFormList[i]['last_name'].text,
          "gender": adultsFormList[i]['gender'].text,
          "dateofbirth": adultsFormList[i]['dateofbirth'].text,
          "nationality": adultsFormList[i]['nationality'].text,
          "mobile": adultsFormList[i]['mobile'].text,
          "email": adultsFormList[i]['email'].text,
          "passportNo": adultsFormList[i]['passportNo'].text,
        },
      );
    }
    update();
    if (childFormList.isNotEmpty) {
      for (int i = 0; i < childFormList.length; i++) {
        childList.add(
          {
            "first_name": adultsFormList[i]['first_name'].text,
            "last_name": adultsFormList[i]['last_name'].text,
            "gender": adultsFormList[i]['gender'].text,
            "dateofbirth": adultsFormList[i]['dateofbirth'].text,
            "nationality": adultsFormList[i]['nationality'].text,
            "mobile": adultsFormList[i]['mobile'].text,
            "email": adultsFormList[i]['email'].text,
            "passportNo": adultsFormList[i]['passportNo'].text,
          },
        );
      }
      update();
    }
    dataList.addAll({
      "adults": adultsList,
      "childs": childList,
    });
    update();
    print("Check Data $dataList");
  }
}
