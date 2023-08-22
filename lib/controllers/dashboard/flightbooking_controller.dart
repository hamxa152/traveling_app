import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:task/models/eticket_model.dart';
import 'package:task/repository/apidata.dart';
import 'package:task/utils/widgets/snackbar.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FlightBookingController extends GetxController {
  bool isLoading = true;

  final storage = GetStorage();

  String journeyType = '';
  String selectedClass = '';
  String from = '';
  String to = '';
  String fromdate = '';
  String todate = '';
  String adults = '';
  String childs = '';

  List price = [];
  List include = [];
  List<ETickets> filghtBookingList = [];

  TextEditingController selectPrice = TextEditingController();
  TextEditingController selectInclude = TextEditingController();

  final Duration initialDelay = const Duration(seconds: 1);

  @override
  void onInit() {
    if (Get.arguments != null) {
      journeyType = Get.arguments['journeyType'];
      selectedClass = Get.arguments['selectedClass'];
      from = Get.arguments['from'];
      to = Get.arguments['to'];
      fromdate = Get.arguments['from_date'];
      todate = Get.arguments['to_date'];
      adults = Get.arguments['adults'];
      childs = Get.arguments['childs'];
      update();
    }
    price = [
      {
        'id': 'Cheap Price',
        'name': 'Cheap Price',
      },
    ];
    include = [
      {
        'id': 'Stop Included',
        'name': 'Stop Included',
      },
    ];
    update();
    super.onInit();
  }

  @override
  void onReady() async {
    await getFlights();
    isLoading = false;
    update();
    super.onReady();
  }

  Future<void> getFlights() async {
    try {
      String token = await storage.read('token');
      FormData formData = journeyType == 'OneWay'
          ? FormData.fromMap({
              'journeyType': journeyType,
              'OriginDestinationInfo[0][departureDate]': fromdate,
              // 'OriginDestinationInfo[0][returnDate]': todate,
              'OriginDestinationInfo[0][airportOriginCode]': from,
              'OriginDestinationInfo[0][airportDestinationCode]': to,
              'class': selectedClass,
              'adults': adults,
              'childs': childs,
              'infants': 0.toString(),
              'directFlight': 0.toString(),
            })
          : FormData.fromMap({
              'journeyType': journeyType,
              'OriginDestinationInfo[0][departureDate]': fromdate,
              'OriginDestinationInfo[0][returnDate]': todate,
              'OriginDestinationInfo[0][airportOriginCode]': from,
              'OriginDestinationInfo[0][airportDestinationCode]': to,
              'class': selectedClass,
              'adults': adults,
              'childs': childs,
              'infants': 0.toString(),
              'directFlight': 0.toString(),
            });
      var res = await Dio().post(
        ApiData.baseUrl + ApiData.bookingApi,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
        data: formData,
      );
      var data = res.data;
      if (res.statusCode!.toInt() >= 200 && res.statusCode!.toInt() <= 300) {
        data['data']['flights'].forEach((e) {
          filghtBookingList.add(ETickets.fromJson(e));
        });
        update();
      }
    } on DioException catch (e) {
      var error = e.response!.data;
      if (kDebugMode) {
        print("Api Error $error");
      }
      CommonSnackbar.getSnackbar(
          "Error", "${error['message']['ErrorMessage']}", Colors.red);
      isLoading = false;
      update();
    }
  }

  String returnDateFormat(String d) {
    String c = DateFormat("EE, MMM d").format(DateTime.parse(d));
    return c;
  }

  String durationToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }

  String returnWeekDaysFormat(DateTime d) {
    // DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(d);
    String c = DateFormat('h:mm a').format(d);
    return c;
  }

  String returnDay(String d) {
    String c = DateFormat("EEEE").format(DateTime.parse(d));
    return c;
  }
}
