import 'package:get/get.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductRepository {
  final ApiService _apiService =
      Get.find(); // Use GetX's Get.find() to get the ApiService instance.

  Future<ProductResponse> getProducts() async {
    try {
      final data = await _apiService.getProducts();
      return data;
      // Map the API response data to a List of Product objects using the Product.fromJson() constructor.
      // return data.map((json) => Products.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch products');
    }
  }
}
