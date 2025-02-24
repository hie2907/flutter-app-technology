import 'package:get/get.dart';
import 'package:techonology_equipment/models/product.dart';
import 'package:techonology_equipment/services/api_services.dart';
import 'package:dio/dio.dart' as dio;

class Homecontroller extends GetxController {
  var currentIndex = 0.obs;
  var products = <Product>[].obs;
  var cameraProducts = <Product>[].obs;
  var accessoryProducts = <Product>[].obs;
  final ApiService apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchPopularCategories();
    fetchPopularAccessory();
    fetchPopularCamera();
  }

  Future<void> fetchPopularCategories() async {
    try {
      dio.Response response = await apiService.getPopularCategories();
      var responseData = response.data as Map<String, dynamic>;
      var productsData = responseData['products'] as List<dynamic>;

      products.value = productsData.map((product) {
        return Product(
          name: product['productName'],
          image: product['images']['mainImage'],
          currentPrice: 15990000,
          originalPrice: 22490000,
          discount: 28.9,
          savings: 6500000,
        );
      }).toList();
    } catch (e) {
      print('Failed to load categories: $e');
    }
  }

  Future<void> fetchPopularCamera() async {
    try {
      dio.Response response = await apiService.getPopularCamera();
      var responseData = response.data as Map<String, dynamic>;
      var cameraData = responseData['products'] as List<dynamic>;

      cameraProducts.value = cameraData.map((product) {
        return Product(
          name: product['productName'],
          image: product['images']['mainImage'],
          currentPrice: 15990000,
          originalPrice: 22490000,
          discount: 28.9,
          savings: 6500000,
        );
      }).toList();
    } catch (e) {
      print('Failed to load camera data: $e');
    }
  }

  Future<void> fetchPopularAccessory() async {
    try {
      dio.Response response = await apiService.getPopularAccessory();
      var responseData = response.data as Map<String, dynamic>;
      var accessoryData = responseData['products'] as List<dynamic>;

      accessoryProducts.value = accessoryData.map((product) {
        return Product(
          name: product['productName'],
          image: product['images']['mainImage'],
          currentPrice: 15990000,
          originalPrice: 22490000,
          discount: 28.9,
          savings: 6500000,
        );
      }).toList();
    } catch (e) {
      print('Failed to load camera data: $e');
    }
  }
}
