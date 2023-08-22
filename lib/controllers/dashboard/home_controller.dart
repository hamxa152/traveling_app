import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/utils/appassets.dart';

import '../../repository/apidata.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  bool isViewMore = false;

  final Duration initialDelay = const Duration(seconds: 1);

  int currentTab = 0;

  List tablist = [];
  List classList = [];
  List offersList = [];
  List bestPlacesList = [];
  List bestPackageList = [];

  String startDate = '';
  String endDate = '';

  TextEditingController journeyType = TextEditingController(text: 'Return');
  TextEditingController selectedClass = TextEditingController(text: 'Business');
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
  TextEditingController departure = TextEditingController();
  TextEditingController adults = TextEditingController();
  TextEditingController childs = TextEditingController();

  TextEditingController place = TextEditingController();

  @override
  void onInit() {
    tablist = [
      {'icon': Icons.flight_outlined, 'name': 'Flights'},
      {'icon': Icons.houseboat_outlined, 'name': 'Hotel'},
      {'icon': Icons.directions_car, 'name': 'Car Rental'},
    ];
    classList = [
      {
        'id': 'First',
        'name': 'First',
      },
      {
        'id': 'Business',
        'name': 'Business',
      },
      {
        'id': 'Economy',
        'name': 'Economy',
      },
      {
        'id': 'PremiumEconomy',
        'name': 'Premium Economy',
      },
    ];
    offersList = [
      {
        'imagepath': AppAssets.offer,
        'title': 'Get Up to 20% OFF On Flights with Us',
        'subtitle': 'BreakTheBookingRoutine NOW',
        'code': 'X7HJ3',
      },
      {
        'imagepath': AppAssets.offer,
        'title': 'Get Up to 20% OFF On Flights with Us',
        'subtitle': 'BreakTheBookingRoutine NOW',
        'code': 'X7HJ3',
      },
      {
        'imagepath': AppAssets.offer,
        'title': 'Get Up to 20% OFF On Flights with Us',
        'subtitle': 'BreakTheBookingRoutine NOW',
        'code': 'X7HJ3',
      },
    ];
    bestPlacesList = [
      {
        'imagepath':
            'https://images.unsplash.com/photo-1597659840241-37e2b9c2f55f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80',
        'name': 'Burj Khalifa',
        'price': '231'
      },
      {
        'imagepath':
            'https://images.unsplash.com/photo-1581362072978-14998d01fdaa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=684&q=80',
        'name': 'Queens’s Gambit',
        'price': '145'
      },
      {
        'imagepath':
            'https://images.unsplash.com/photo-1597659840241-37e2b9c2f55f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80',
        'name': 'Burj Khalifa',
        'price': '231'
      },
    ];
    bestPackageList = [
      {
        'imagepath':
            'https://images.unsplash.com/photo-1597659840241-37e2b9c2f55f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80',
        'name': 'Burj Khalifa',
        'price': '231',
        'place': 'Dubai',
        'package': '3D/2N',
        'people': 5
      },
      {
        'imagepath':
            'https://images.unsplash.com/photo-1581362072978-14998d01fdaa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=684&q=80',
        'name': 'Queens’s Gambit',
        'price': '145',
        'place': 'Dubai',
        'package': '3D/2N',
        'people': 5
      },
      {
        'imagepath':
            'https://images.unsplash.com/photo-1597659840241-37e2b9c2f55f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80',
        'name': 'Burj Khalifa',
        'price': '231',
        'place': 'Dubai',
        'package': '3D/2N',
        'people': 5
      },
    ];
    update();
    super.onInit();
  }

  @override
  void onReady() {
    isLoading = false;
    update();
    super.onReady();
  }

  Future<String> getCountryCode(double lat, double lng) async {
    var res = await Dio().get('${ApiData.getCountryCode}$lat/$lng');
    var data = res.data;
    return data['IATA'];
  }
}
