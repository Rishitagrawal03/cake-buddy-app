import 'package:flutter/material.dart';

import 'core/constants/app_colors.dart';
import 'core/theme/app_theme.dart';

import 'models/product_model.dart';

import 'screens/home/home_screen.dart';
import 'screens/categories/categories_screen.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/orders/orders_screen.dart';
import 'screens/profile/profile_screen.dart';

void main() {
  runApp(const CakeBuddyApp());
}

class CakeBuddyApp extends StatefulWidget {
  const CakeBuddyApp({super.key});

  @override
  State<CakeBuddyApp> createState() => _CakeBuddyAppState();
}

class _CakeBuddyAppState extends State<CakeBuddyApp> {
  int selectedIndex = 0;

  final Map<int, int> cart = {};

  int get cartCount {
    return cart.values.fold(0, (total, quantity) => total + quantity);
  }

  double get cartTotal {
    double total = 0;

    // Product prices will be calculated in the cart screen
    // from the current product catalogue.
    return total;
  }

  void addToCart(Product product) {
    setState(() {
      cart[product.id] = (cart[product.id] ?? 0) + 1;
    });
  }

  void updateQuantity(int id, int quantity) {
    setState(() {
      if (quantity <= 0) {
        cart.remove(id);
      } else {
        cart[id] = quantity;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(
        onAdd: addToCart,
        cart: cart,
        onQuantityChange: updateQuantity,
      ),

      CategoriesScreen(
        cart: cart,
        onAdd: addToCart,
        onQuantityChange: updateQuantity,
      ),

      CartScreen(
        cart: cart,
        total: cartTotal,
        onQuantityChange: updateQuantity,
      ),

      const OrdersScreen(),

      const ProfileScreen(),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CakeBuddy',
      theme: AppTheme.lightTheme,

      home: Scaffold(
        body: SafeArea(
          child: IndexedStack(index: selectedIndex, children: screens),
        ),

        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,

          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },

          destinations: [
            const NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),

            const NavigationDestination(
              icon: Icon(Icons.grid_view_outlined),
              selectedIcon: Icon(Icons.grid_view),
              label: 'Categories',
            ),

            NavigationDestination(
              icon: Badge(
                isLabelVisible: cartCount > 0,
                label: Text('$cartCount'),
                child: const Icon(Icons.shopping_bag_outlined),
              ),
              selectedIcon: const Icon(Icons.shopping_bag),
              label: 'Cart',
            ),

            const NavigationDestination(
              icon: Icon(Icons.receipt_long_outlined),
              selectedIcon: Icon(Icons.receipt_long),
              label: 'Orders',
            ),

            const NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
