import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techonology_equipment/models/payment.dart';

class PaymentController extends GetxController {
  final _selectDate = DateTime.now().obs;
  final _paymentStatus = PaymentStatus.unpaid.obs;
  DateTime get selectDate => _selectDate.value;
  PaymentStatus get paymentStatus => _paymentStatus.value;

  void changePaymentStatus(PaymentStatus? newstatus) {
    if (newstatus != null) {
      _paymentStatus.value = newstatus;
    }
  }

  Future<void> selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectDate.value,
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectDate.value) {
      _selectDate.value = picked;
    }
  }
}
