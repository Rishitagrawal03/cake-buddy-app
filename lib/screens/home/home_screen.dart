import 'package:cakebuddy_customer/screens/product/product_details_screen.dart'
    show ProductDetailsScreen;
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../data/sample_products.dart';
import '../../models/product_model.dart';
import '../../widgets/product_card.dart';
import '../../widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  final Function(Product) onAdd;
  final Map<int, int> cart;
  final Function(int, int) onQuantityChange;

  const HomeScreen({
    super.key,
    required this.onAdd,
    required this.cart,
    required this.onQuantityChange,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String search = '';

  @override
  Widget build(BuildContext context) {
    final filtered = products.where((p) {
      return p.name.toLowerCase().contains(search.toLowerCase()) ||
          p.category.toLowerCase().contains(search.toLowerCase());
    }).toList();

    return CustomScrollView(
      slivers: [
        // HEADER
        SliverToBoxAdapter(
          child: Container(
            color: AppColors.primary,
            padding: const EdgeInsets.fromLTRB(18, 15, 18, 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 25,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Delivering to',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            'Select your location',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                const Text(
                  'Celebrate every moment!',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  'Everything you need for a perfect celebration.',
                  style: TextStyle(fontSize: 13, color: Colors.white70),
                ),

                const SizedBox(height: 20),

                TextField(
                  onChanged: (value) {
                    setState(() {
                      search = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search balloons, gifts, decorations...',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.primary,
                    ),
                    suffixIcon: search.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              setState(() => search = '');
                            },
                            icon: const Icon(Icons.close),
                          )
                        : null,
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // PROMOTIONAL BANNER
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 8),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: AppColors.darkGreen,
                borderRadius: BorderRadius.circular(18),
              ),
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'MAKE IT SPECIAL',
                          style: TextStyle(
                            color: Color(0xFFB9E4CC),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Birthday celebrations\nmade easy!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Explore celebration essentials',
                          style: TextStyle(color: Colors.white70, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  const Text('🎉🎈', style: TextStyle(fontSize: 48)),
                ],
              ),
            ),
          ),
        ),

        // CATEGORIES
        const SliverToBoxAdapter(
          child: SectionTitle(
            title: 'Shop by category',
            subtitle: 'Find everything for your celebration',
          ),
        ),

        SliverToBoxAdapter(
          child: SizedBox(
            height: 115,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];

                return Container(
                  width: 82,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          color: AppColors.lightGreen,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          category['emoji']!,
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        category['name']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),

        // PRODUCT TITLE
        SliverToBoxAdapter(
          child: SectionTitle(
            title: search.isEmpty ? 'Trending products' : 'Search results',
            subtitle: 'Make your celebrations unforgettable',
          ),
        ),

        // PRODUCT GRID
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              final product = filtered[index];

              return ProductCard(
                product: product,
                quantity: widget.cart[product.id] ?? 0,

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailsScreen(
                        product: product,
                        quantity: widget.cart[product.id] ?? 0,
                        onAdd: widget.onAdd,
                        onQuantityChange: widget.onQuantityChange,
                      ),
                    ),
                  );
                },

                onAdd: () {
                  widget.onAdd(product);
                },

                onRemove: () {
                  final currentQuantity = widget.cart[product.id] ?? 0;
                  widget.onQuantityChange(product.id, currentQuantity - 1);
                },
              );
            }, childCount: filtered.length),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.78,
            ),
          ),
        ),

        if (filtered.isEmpty)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Center(child: Text('No products found')),
            ),
          ),
      ],
    );
  }
}
