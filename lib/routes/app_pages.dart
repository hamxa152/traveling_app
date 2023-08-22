import 'package:get/get.dart';
import 'package:task/bindings/booking_binding.dart';
import 'package:task/bindings/dashboard_binding.dart';
import 'package:task/bindings/flightbooking_binding.dart';
import 'package:task/bindings/login_binding.dart';
import 'package:task/bindings/pin_binding.dart';
import 'package:task/bindings/register_binding.dart';
import 'package:task/routes/app_routes.dart';
import 'package:task/views/auth/login_screen.dart';
import 'package:task/views/auth/pin_screen.dart';
import 'package:task/views/auth/register_screen.dart';
import 'package:task/views/dashboard/booking/booking_screen.dart';
import 'package:task/views/dashboard/booking/flightbooking_screen.dart';
import 'package:task/views/dashboard/dashboard_scree.dart';

class AppPages {
  static const initial = Routes.loginRoutes;

  static List<GetPage> routes = [
    GetPage(
      name: Routes.loginRoutes,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.registerRoutes,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.dashboardRoutes,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.flightbookingRoutes,
      page: () => const FlightBooking(),
      binding: FlightBookingBinding(),
    ),
    GetPage(
      name: Routes.bookingRoutes,
      page: () => const BookingScreen(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: Routes.pinRoutes,
      page: () => const PinScreen(),
      binding: PinScreenBinding(),
    ),
  ];
}
