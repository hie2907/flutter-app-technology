import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techonology_equipment/controllers/mainController.dart';
import 'package:techonology_equipment/widgets/custom_bottom_bar.dart';

class MainLayout extends StatelessWidget {
  // final Widget body;
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController apiController = Get.find<MainController>();
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: const CustomAppBar(),
      body: Obx(
        () => IndexedStack(
          index: apiController.currentIndex.value,
          children: apiController.pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => CustomBottomNavigationBar(
          currentIndex: apiController.currentIndex.value,
          onTap: (index) {
            apiController.changePage(index);
          },
        ),
      ),
    );
  }
}
