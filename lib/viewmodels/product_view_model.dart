import 'package:get/get.dart';
import 'package:productapp/data/models/product.dart';
import 'package:productapp/data/repositories/product_repository.dart';

class ProductViewModel extends GetxController {
  final ProductRepository _productRepository =
      Get.find(); // Use GetX's Get.find() to get the ProductRepository instance.

  final RxList<Products> _products =
      <Products>[].obs; // List to store product data fetched from the API.
  bool _loading =
      false; // Boolean flag to track if data is currently being fetched.
  String _errorMessage =
      ''; // String to store any error message that occurs during data fetching.

  List<Products> get products =>
      _products; // Getter method to access the list of products.
  bool get loading => _loading; // Getter method to access the loading flag.
  String get errorMessage =>
      _errorMessage; // Getter method to access the error message.

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    _loading = true;
    _errorMessage = '';

    try {
      ProductResponse products =
          await _productRepository.getProducts() as ProductResponse;
      _products.value = await products.products as List<Products>;
      print(products);
      // _products.value = (await _productRepository.getProducts()) as List<Products>;
    } catch (e) {
      _errorMessage = 'Failed to fetch products';
    } finally {
      _loading = false;
      update(); // Use GetX's update() to notify listeners of data change.
    }
  }

  // Future<void> fetchProducts() async {
  //   _loading = true;
  //   _errorMessage = '';

  //   try {
  //     _products.value = (await _productRepository.getProducts()) as List<Products>;
  //   } catch (e) {
  //     _errorMessage = 'Failed to fetch products';
  //   } finally {
  //     _loading = false;
  //     update(); // Use GetX's update() to notify listeners of data change.
  //   }
  // }
}
