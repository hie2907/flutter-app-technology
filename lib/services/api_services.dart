import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = "http://10.0.2.2:8001";
  final Dio dio = Dio();
  Future<Response> getPopularCategories() async {
    Response response = await dio.get("$baseUrl/api/categories/laptop");
    return response;
  }

  Future<Response> getPopularCamera() async {
    Response response = await dio.get("$baseUrl/api/categories/camera");
    return response;
  }

  Future<Response> getPopularAccessory() async {
    Response response = await dio.get("$baseUrl/api/categories/accessory");
    return response;
  }
}
