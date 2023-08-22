
import 'package:get/get.dart';
import 'package:task/controllers/dashboard/flightbooking_controller.dart';

class FlightBookingBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<FlightBookingController>(() => FlightBookingController());
  }

}
