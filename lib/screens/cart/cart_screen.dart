
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../data/sample_products.dart';
import '../../models/product_model.dart';

class CartScreen extends StatelessWidget {
  final Map<int, int> cart;
  final double total;
  final Function(int, int) onQuantityChange;

  const CartScreen({
    super.key,
    required this.cart,
    required this.total,
    required this.onQuantityChange,
  });

  @override
  Widget build(BuildContext context) {
    final List<Product> items =
        products.where((p) => cart.containsKey(p.id)).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('My Cart'),
      ),
      body: items.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 65,
                    color: AppColors.primary,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Your cart is empty!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text('Add something for your celebration.'),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(14),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final product = items[index];
                      final quantity = cart[product.id]!;

                      return Card(
                        color: Colors.white,
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  product.image,
                                  width: 75,
                                  height: 75,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) {
                                    return Container(
                                      width: 75,
                                      height: 75,
                                      color: AppColors.lightGreen,
                                      child: const Icon(Icons.image),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '₹${product.price.toStringAsFixed(0)}',
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            onQuantityChange(
                                              product.id,
                                              quantity - 1,
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.remove_circle_outline,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                        Text('$quantity'),
                                        IconButton(
                                          onPressed: () {
                                            onQuantityChange(
                                              product.id,
                                              quantity + 1,
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.add_circle_outline,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Subtotal',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '₹${total.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.darkGreen,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(15),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Checkout will be connected next!',
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            'PROCEED TO CHECKOUT',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
