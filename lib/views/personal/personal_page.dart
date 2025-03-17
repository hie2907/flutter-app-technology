import 'package:flutter/material.dart';
import 'package:techonology_equipment/views/payments/personal_payment.dart';
import 'package:techonology_equipment/views/personal/widgets/personal_menu_item.dart';
import 'package:get/get.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color(0xFF1a237e),
            height: MediaQuery.of(context).size.height * 0.26,
            width: double.infinity,
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFF2A4BA0),
                  minimumSize: const Size(300, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Đăng Ký / Đăng Nhập',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                MenuItem(
                  icon: Icons.person_outline,
                  title: 'Giới thiệu bạn bè',
                  onTap: () {},
                ),
                MenuItem(
                  icon: Icons.history,
                  title: 'Lịch sử điểm thành viên',
                  onTap: () {},
                ),
                MenuItem(
                  icon: Icons.shopping_bag_outlined,
                  title: 'Quản lý đơn hàng',
                  onTap: () {},
                ),
                MenuItem(
                  icon: Icons.location_on_outlined,
                  title: 'Số địa chỉ',
                  onTap: () {},
                ),
                MenuItem(
                  icon: Icons.headset_mic_outlined,
                  title: 'Hỗ trợ 0932412321',
                  onTap: () {},
                ),
                MenuItem(
                  icon: Icons.money_outlined,
                  title: 'Thanh toán',
                  onTap: () {
                    Get.to(() => const PersonalPayment());
                  },
                ),
                MenuItem(
                  icon: Icons.policy_outlined,
                  title: 'Chính sách và điều khoản',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
