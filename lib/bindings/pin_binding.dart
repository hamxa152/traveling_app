
import 'package:get/get.dart';
import 'package:task/controllers/auth/pinscreen_controller.dart';

class PinScreenBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<PinScreenController>(() => PinScreenController());
  }

}
