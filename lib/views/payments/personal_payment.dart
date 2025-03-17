import 'package:flutter/material.dart';

class PersonalPayment extends StatelessWidget {
  const PersonalPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán cá nhân'),
      ),
      body: const Center(
        child: Text('Personal Payment'),
      ),
    );
  }
}
