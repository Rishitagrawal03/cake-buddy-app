import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../../data/sample_products.dart';
import '../../widgets/product_card.dart';
import '../product/product_details_screen.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String category;
  final Map<int, int> cart;
  final Function(Product) onAdd;
  final Function(int, int) onQuantityChange;

  const CategoryProductsScreen({
    super.key,
    required this.category,
    required this.cart,
    required this.onAdd,
    required this.onQuantityChange,
  });

  @override
  Widget build(BuildContext context) {
    final categoryProducts = products
        .where((product) => product.category == category)
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.78,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: categoryProducts.length,
        itemBuilder: (context, index) {
          final product = categoryProducts[index];
          final quantity = cart[product.id] ?? 0;

          return ProductCard(
            product: product,
            quantity: quantity,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsScreen(
                    product: product,
                    quantity: quantity,
                    onAdd: onAdd,
                    onQuantityChange: onQuantityChange,
                  ),
                ),
              );
            },
            onAdd: () => onAdd(product),
            onRemove: () {
              onQuantityChange(product.id, quantity - 1);
            },
          );
        },
      ),
    );
  }
}
