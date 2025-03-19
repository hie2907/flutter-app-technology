import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:techonology_equipment/routes/app_routes.dart';
import 'package:techonology_equipment/services/api.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Api().init1();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: GetMaterialApp(
        title: 'PhongVu App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFF1a237e),
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.mainPage,
        getPages: AppRoutes.routes,
      ),
    );
  }
}
