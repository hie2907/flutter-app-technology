import 'package:get/get.dart';
import 'package:techonology_equipment/controllers/mainController.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
  }
}
