import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:techonology_equipment/views/home/bindings/home_binding.dart';
import 'package:techonology_equipment/views/home/home_page.dart';

class AppRoutes {
  static const homePage = '/';

  static final routes = [
    GetPage(
      name: homePage,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
