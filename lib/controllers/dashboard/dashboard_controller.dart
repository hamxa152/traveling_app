import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController
{
  bool isLoading = true;

  int currentindex = 0;
  ListQueue<int> navigationQueue = ListQueue();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List iconbuttonList = [];

  @override
  void onInit() {
    iconbuttonList = [
      {
        'icon' : Icons.home_filled,
        'title' : 'Home'
      },
      {
        'icon' : Icons.wallet,
        'title' : 'Wallet'
      },
      {
        'icon' : Icons.local_offer_outlined,
        'title' : 'Offers'
      },
      {
        'icon' : Icons.wallet_travel_rounded,
        'title' : 'Booking'
      },
    ];
    super.onInit();
  }

  @override
  void onReady() {
    isLoading = false;
    update();
    super.onReady();
  }



  void changeTabIndex(int index) {
    currentindex = index;

    if (index == currentindex) {
      navigationQueue.clear();
      navigationQueue.addLast(index);
      currentindex = index;
      update();
    }
    update();
  }


}