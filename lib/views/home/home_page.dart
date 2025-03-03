import 'package:flutter/material.dart';
import 'package:techonology_equipment/controllers/homeController.dart';
import 'package:techonology_equipment/views/home/widgets/home_carousel.dart';
import 'package:techonology_equipment/views/home/widgets/product_section.dart';
import 'package:techonology_equipment/widgets/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:techonology_equipment/widgets/custom_bottom_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Homecontroller apiController = Get.find<Homecontroller>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: HomeCarousel(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: _buildPromotionCards(),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          Obx(() {
            if (apiController.products.isEmpty) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return SliverToBoxAdapter(
                child: ProductSection(
                  title: 'LAPTOP',
                  backgroundColor: const Color(0xFFFFB6C1),
                  products: apiController.products,
                ),
              );
            }
          }),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          Obx(() {
            if (apiController.cameraProducts.isEmpty) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return SliverToBoxAdapter(
                child: ProductSection(
                  title: 'CAMERA',
                  backgroundColor: const Color(0xFF1a237e),
                  products: apiController.cameraProducts,
                ),
              );
            }
          }),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          Obx(() {
            if (apiController.accessoryProducts.isEmpty) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return SliverToBoxAdapter(
                child: ProductSection(
                  title: 'THIẾT BỊ',
                  backgroundColor: const Color(0xFFFFB6C1),
                  products: apiController.accessoryProducts,
                ),
              );
            }
          }),
        ],
      ),
      bottomNavigationBar: Obx(() {
        return CustomBottomNavigationBar(
          currentIndex: apiController.currentIndex.value,
          onTap: (index) {
            apiController.currentIndex.value = index;
          },
        );
      }),
    );
  }

  List<Widget> _buildPromotionCards() {
    final promotions = [
      {'title': 'MÀN HÌNH', 'discount': 'Giảm Tới 49%'},
      {'title': 'ĐIỆN GIA DỤNG', 'discount': 'Giảm Tới 68%'},
      {'title': 'LOA SAMSUNG', 'discount': 'Giảm Tới 69%'},
      {'title': 'BÀN PHÍM PHỤ KIỆN', 'discount': 'Giảm Tới 50%'},
    ];

    return promotions.map((promo) {
      return Container(
        width: 180,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: promotions.indexOf(promo) == 0
              ? const Color(0xFF1a237e)
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              promo['title']!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: promotions.indexOf(promo) == 0
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              promo['discount']!,
              style: TextStyle(
                color: promotions.indexOf(promo) == 0
                    ? Colors.white
                    : Colors.black87,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
