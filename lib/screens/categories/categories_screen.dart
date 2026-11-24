import 'package:cakebuddy_customer/screens/categories/category_product_screen.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../data/sample_products.dart';
import '../../models/product_model.dart';

class CategoriesScreen extends StatelessWidget {
  final Map<int, int> cart;
  final Function(Product) onAdd;
  final Function(int, int) onQuantityChange;

  const CategoriesScreen({
    super.key,
    required this.cart,
    required this.onAdd,
    required this.onQuantityChange,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Explore Categories'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(14),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];

          return InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () {
              final selected = products
                  .where((p) => p.category == category['name'])
                  .toList();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CategoryProductsScreen(
                    category: category['name']!,
                    cart: cart,
                    onAdd: onAdd,
                    onQuantityChange: onQuantityChange,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: AppColors.lightGreen,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      category['emoji']!,
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    category['name']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
