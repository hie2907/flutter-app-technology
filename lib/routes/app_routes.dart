import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:techonology_equipment/utils/binding/main_binding.dart';
import 'package:techonology_equipment/views/auth/authen_binding.dart';
import 'package:techonology_equipment/views/auth/login/login_page.dart';
import 'package:techonology_equipment/views/auth/register/register_page.dart';
import 'package:techonology_equipment/views/home/bindings/home_binding.dart';
import 'package:techonology_equipment/views/home/home_page.dart';
import 'package:techonology_equipment/views/payments/payment_screens/add_payment_screen.dart';
import 'package:techonology_equipment/views/payments/payment_page.dart';
import 'package:techonology_equipment/views/payments/payment_binding.dart';
import 'package:techonology_equipment/widgets/custom_main_layout.dart';

class AppRoutes {
  static const homePage = '/';
  static const mainPage = '/main';
  static const paymentManagerPage = '/payment-manager';
  static const addPaymentPage = '/add-payment';
  static const updatePaymentPage = '/update-payment';

  /* Authencation */
  static const loginPage = '/login';
  static const registerPage = '/register';

  static final routes = [
    GetPage(
      name: homePage,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: mainPage,
      page: () => const MainLayout(),
      binding: MainBinding(),
    ),
    GetPage(
      name: paymentManagerPage,
      page: () => const PaymentPage(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: addPaymentPage,
      page: () => const AddPaymentScreen(),
      binding: AddPaymentManagerBinding(),
    ),
    GetPage(
      name: loginPage,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: registerPage,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
  ];
}
