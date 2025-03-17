import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:techonology_equipment/controllers/paymentController.dart';
import 'package:techonology_equipment/models/payment.dart';

class AddPaymentScreen extends StatefulWidget {
  const AddPaymentScreen({super.key});

  @override
  State<AddPaymentScreen> createState() => _AddPaymentScreen();
}

class _AddPaymentScreen extends State<AddPaymentScreen> {
  final PaymentController paymentController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm khoản thanh toán'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Người Thanh Toán',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Số tiền',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Tình Trạng',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  paymentController.selectedDate(context);
                },
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Ngày Thanh Toán',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  child: Obx(
                    () => Text(
                      DateFormat('dd/MM/yyyy')
                          .format(paymentController.selectDate),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Trạng Thái Thanh Toán',
                  border: OutlineInputBorder(),
                ),
                child: DropdownButtonHideUnderline(
                  child: Obx(
                    () => DropdownButton<PaymentStatus>(
                      isExpanded: true,
                      value: paymentController.paymentStatus,
                      onChanged: paymentController.changePaymentStatus,
                      items: const [
                        DropdownMenuItem(
                          value: PaymentStatus.unpaid,
                          child: Text('Chưa Thanh Toán'),
                        ),
                        DropdownMenuItem(
                          value: PaymentStatus.paid,
                          child: Text('Đã Thanh Toán'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Lưu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
