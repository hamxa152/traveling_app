
import 'package:get/get.dart';
import 'package:task/controllers/auth/login_controller.dart';

class LoginBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }

}
