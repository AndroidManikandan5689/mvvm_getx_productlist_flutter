import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import the getx package.
import 'package:productapp/viewmodels/product_view_model.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: GetBuilder<ProductViewModel>(
        // Use GetBuilder to access the ProductViewModel.
        init: ProductViewModel(), // Initialize the ProductViewModel instance.
        builder: (productViewModel) {
          // Use the productViewModel to access the state data.
          return productViewModel.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : productViewModel.errorMessage.isNotEmpty
                  ? Center(
                      child: Text(productViewModel.errorMessage),
                    )
                  : ListView.builder(
                      itemCount: productViewModel.products.length,
                      itemBuilder: (context, index) {
                        final product = productViewModel.products[index];

                        return ListTile(
                          title: Text(product.title.toString()),
                          subtitle: Text(product.description.toString()),
                          leading: CircleAvatar(
                            child: Image(image: NetworkImage(product.thumbnail.toString())),
                          ),
                        );
                      },
                    );
        },
      ),
    );
  }
}
