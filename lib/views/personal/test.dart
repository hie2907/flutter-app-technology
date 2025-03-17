import 'package:flutter/material.dart';

class PersonalPage1 extends StatelessWidget {
  const PersonalPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Blue header
          Container(
            color: const Color(0xFF1a237e),
            height: MediaQuery.of(context).padding.top + 150,
            width: double.infinity,
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5F5F5),
                  foregroundColor: const Color(0xFF2A4BA0),
                  minimumSize: const Size(300, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Đăng ký / Đăng nhập',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),

          // Menu items
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem(
                  icon: Icons.person_outline,
                  title: 'Giới thiệu bạn bè',
                ),
                _buildMenuItem(
                  icon: Icons.history,
                  title: 'Lịch sử điểm thành viên',
                ),
                _buildMenuItem(
                  icon: Icons.shopping_bag_outlined,
                  title: 'Quản lý đơn hàng',
                ),
                _buildMenuItem(
                  icon: Icons.location_on_outlined,
                  title: 'Số địa chỉ',
                ),
                _buildMenuItem(
                  icon: Icons.language,
                  title: 'Thay đổi ngôn ngữ',
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Image.network(
                      //   'https://upload.wikimedia.org/wikipedia/commons/2/21/Flag_of_Vietnam.svg',
                      //   width: 4,
                      //   height: 6,
                      // ),
                      // const SizedBox(width: 8),
                      const Text(
                        'Tiếng Việt',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.chevron_right,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),
                _buildMenuItem(
                  icon: Icons.local_offer_outlined,
                  title: 'Khuyến mãi Hot',
                  isHot: true,
                ),
                _buildMenuItem(
                  icon: Icons.headset_mic_outlined,
                  title: 'Hỗ trợ 0932412321',
                ),
                _buildMenuItem(
                  icon: Icons.policy_outlined,
                  title: 'Chính sách và điều khoản',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    Widget? trailing,
    bool isHot = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black54,
        size: 22,
      ),
      title: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          if (isHot) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'Hot',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ],
      ),
      trailing:
          trailing ?? const Icon(Icons.chevron_right, color: Colors.black38),
      onTap: () {},
    );
  }
}
