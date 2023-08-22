
import 'package:get/get.dart';
import 'package:task/controllers/dashboard/booking_controller.dart';

class BookingBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<BookingController>(() => BookingController());
  }

}
