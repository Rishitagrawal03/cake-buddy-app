import 'package:flutter/material.dart';

class SameDayScreen extends StatefulWidget {
  const SameDayScreen({super.key});

  @override
  State<SameDayScreen> createState() => _SameDayScreenState();
}

class _SameDayScreenState extends State<SameDayScreen> {
  final Set<int> _wishlist = {};

  // Sample data — replace with API call later
  final List<Map<String, dynamic>> products = [
    {
      "name": "Rosy Orchid Celebration Bouquet",
      "subtitle": "Fresh flowers, hand-tied",
      "price": 899,
      "oldPrice": 999,
      "discount": "10% OFF",
      "rating": 5.0,
      "reviews": 126,
      "tag": "Bestseller",
      "image": "https://images.unsplash.com/photo-1526047932273-341f2a7631f9?w=400",
    },
    {
      "name": "Exotic Blue Orchid Arrangement",
      "subtitle": "Premium orchids in a vase",
      "price": 649,
      "oldPrice": 849,
      "discount": "24% OFF",
      "rating": 5.0,
      "reviews": 376,
      "tag": "Top Rated",
      "image": "https://images.unsplash.com/photo-1563241527-3004b7be0ffd?w=400",
    },
    {
      "name": "Pink Rose Special Bouquet",
      "subtitle": "50 fresh pink roses",
      "price": 749,
      "oldPrice": 899,
      "discount": "18% OFF",
      "rating": 4.9,
      "reviews": 205,
      "tag": "Trending",
      "image": "https://images.unsplash.com/photo-1520763185298-1b434c919102?w=400",
    },
    {
      "name": "Luxury Purple Flower Basket",
      "subtitle": "Mixed blooms in a gift basket",
      "price": 999,
      "oldPrice": 1199,
      "discount": "15% OFF",
      "rating": 5.0,
      "reviews": 411,
      "tag": "New",
      "image": "https://images.unsplash.com/photo-1494336934272-fd5b9c13f9b7?w=400",
    },
    {
      "name": "Chocolate Truffle Cake",
      "subtitle": "500g, eggless available",
      "price": 599,
      "oldPrice": 749,
      "discount": "20% OFF",
      "rating": 4.8,
      "reviews": 892,
      "tag": "Bestseller",
      "image": "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=400",
    },
    {
      "name": "Red Velvet Delight",
      "subtitle": "1kg, cream cheese frosting",
      "price": 799,
      "oldPrice": 999,
      "discount": "20% OFF",
      "rating": 4.9,
      "reviews": 543,
      "tag": "Top Rated",
      "image": "https://images.unsplash.com/photo-1586788680434-30d324b2d46f?w=400",
    },
  ];

  final List<Map<String, dynamic>> categories = [
    {
      "title": "Mother's\nDay",
      "image": "https://cdn-icons-png.flaticon.com/512/869/869636.png",
    },
    {
      "title": "Flowers",
      "image": "https://cdn-icons-png.flaticon.com/512/616/616408.png",
    },
    {
      "title": "Cakes",
      "image": "https://cdn-icons-png.flaticon.com/512/2682/2682446.png",
    },
    {
      "title": "Personalised",
      "image": "https://cdn-icons-png.flaticon.com/512/2922/2922510.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildDeliveryBanner(),
              const SizedBox(height: 24),
              _buildCategoryList(),
              const SizedBox(height: 20),
              _buildSectionHeader(),
              const SizedBox(height: 16),
              _buildFilterRow(),
              const SizedBox(height: 20),
              _buildProductGrid(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.white,
      leading: const Icon(Icons.arrow_back, color: Colors.black),
      title: const Text(
        "Same Day Delivery",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, color: Colors.black),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  "1",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDeliveryBanner() {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [Color(0xFF6B7A16), Color(0xFFA6B637)],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFA6B637).withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FREE DELIVERY!!!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "On eligible delivery time slots.",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            const Icon(Icons.delivery_dining, color: Colors.white, size: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final item = categories[index];
          return Column(
            children: [
              Container(
                height: 72,
                width: 72,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.07),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Image.network(item['image'], fit: BoxFit.contain),
              ),
              const SizedBox(height: 8),
              Text(
                item['title'],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader() {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Same-Day Gifts",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "  ${products.length * 445} items",
            style: const TextStyle(color: Colors.grey, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _filterChip(Icons.filter_alt_outlined, "Filters"),
          _filterChip(Icons.swap_vert, "Sort By"),
          _filterChip(null, "Price"),
          _filterChip(null, "Delivery"),
        ],
      ),
    );
  }

  Widget _filterChip(IconData? icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 16, color: Colors.black87),
              const SizedBox(width: 6),
            ],
            Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.black54),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      itemCount: products.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 0.58,
      ),
      itemBuilder: (context, index) => _ProductCard(
        product: products[index],
        isWishlisted: _wishlist.contains(index),
        onWishlistToggle: () => setState(() {
          _wishlist.contains(index) ? _wishlist.remove(index) : _wishlist.add(index);
        }),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final bool isWishlisted;
  final VoidCallback onWishlistToggle;

  const _ProductCard({
    required this.product,
    required this.isWishlisted,
    required this.onWishlistToggle,
  });

  @override
  Widget build(BuildContext context) {
    final tagColors = {
      "Bestseller": const Color(0xFFFF6B35),
      "Top Rated": const Color(0xFF4CAF50),
      "Trending": const Color(0xFF9C27B0),
      "New": const Color(0xFF2196F3),
    };
    final tagColor = tagColors[product['tag']] ?? Colors.grey;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(
                  product['image'],
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 170,
                    color: Colors.grey.shade100,
                    child: const Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                ),
              ),
              // Discount badge
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.shade600,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    product['discount'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Wishlist button
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: onWishlistToggle,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Icon(
                      isWishlisted ? Icons.favorite : Icons.favorite_border,
                      color: isWishlisted ? Colors.red : Colors.grey,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Details section
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tag
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    color: tagColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    product['tag'],
                    style: TextStyle(
                      color: tagColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                // Product name
                Text(
                  product['name'],
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 3),

                // Subtitle
                Text(
                  product['subtitle'],
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 8),

                // Price row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "₹${product['price']}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "₹${product['oldPrice']}",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey.shade400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // Rating
                Row(
                  children: [
                    const Icon(Icons.star_rounded, color: Color(0xFFFFC107), size: 15),
                    const SizedBox(width: 3),
                    Text(
                      "${product['rating']}",
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      " (${product['reviews']})",
                      style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // Delivery info
                Row(
                  children: [
                    Icon(Icons.bolt, color: Colors.blue.shade400, size: 14),
                    const SizedBox(width: 3),
                    Text(
                      "Delivery: Today",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.blue.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Add to Cart button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6B7A16),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
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
