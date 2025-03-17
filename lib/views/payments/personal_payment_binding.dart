import 'package:get/get.dart';
import 'package:techonology_equipment/controllers/paymentController.dart';

class PersonalPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}

class AddPaymentManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}
