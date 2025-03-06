import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techonology_equipment/views/home/home_page.dart';
import 'package:techonology_equipment/views/personal/personal_page.dart';

class MainController extends GetxController {
  var currentIndex = 0.obs;
  void changePage(int index) {
    currentIndex.value = index;
  }

  final List<Widget> pages = [
    const HomePage(),
    const PersonalPage(),
  ];
}
