import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:techonology_equipment/utils/binding/main_binding.dart';
import 'package:techonology_equipment/views/home/bindings/home_binding.dart';
import 'package:techonology_equipment/views/home/home_page.dart';
import 'package:techonology_equipment/widgets/custom_main_layout.dart';

class AppRoutes {
  static const homePage = '/';
  static const mainPage = '/main';

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
  ];
}
