import 'package:dio/dio.dart';
import 'package:productapp/data/models/product.dart';

class ApiService {
  final Dio _dio; // Dio instance to perform HTTP requests.

  ApiService({required Dio dio}) : _dio = dio;

  Future<ProductResponse> getProducts() async {
    try {
      // Make a GET request to the API endpoint to fetch Product data.
      final response =
          await _dio.get('https://dummyjson.com/products');

      // Check if the response status code is 200 (OK).
      if (response.statusCode == 200) {
        return ProductResponse.fromJson(response.data); // If successful, return the response data (List of dynamic).
      } else {
        // If the response status code is not 200, throw an exception with an error message.
        throw Exception('API failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // If any exception occurs during the API call, throw an exception with the error message.
      throw Exception('An error occurred: $e');
    }
  }
}
