
import 'package:get/get.dart';
import 'package:task/controllers/dashboard/dashboard_controller.dart';
import 'package:task/controllers/dashboard/home_controller.dart';

class DashboardBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
  }

}
