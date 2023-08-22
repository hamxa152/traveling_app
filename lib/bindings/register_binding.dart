
import 'package:get/get.dart';
import 'package:task/controllers/auth/register_controller.dart';

class RegisterBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }

}
