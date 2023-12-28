import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:productapp/view/products.dart';
import 'package:productapp/viewmodels/product_view_model.dart';
import './data/repositories/product_repository.dart';
import './data/services/api_service.dart';

void main() {
  // Initialize GetX dependency injection
  Get.put(ApiService(dio: Dio())); // ApiService instance
  Get.put(ProductRepository()); // ProductRepository instance
  Get.put(ProductViewModel()); // ProductViewModel instance

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List', // Meta Title for the App
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Products(),
    );
  }
}