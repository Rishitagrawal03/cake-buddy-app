import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  final Widget? activeOrderCard;
  final List<Widget> availableOrderCards;

  const OrdersScreen({
    super.key,
    required this.activeOrderCard,
    required this.availableOrderCards,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Orders",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            "Manage your delivery requests and active orders",
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 20),

          if (activeOrderCard != null) ...[
            const Text(
              "Active Order",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            activeOrderCard!,
            const SizedBox(height: 20),
          ],

          const Text(
            "Available Orders",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          if (availableOrderCards.isEmpty)
            _emptyState()
          else
            ...availableOrderCards,
        ],
      ),
    );
  }

  Widget _emptyState() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 45),
      child: Column(
        children: [
          Icon(Icons.receipt_long, size: 55, color: Colors.grey.shade400),
          const SizedBox(height: 12),
          const Text(
            "No available orders",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            "New delivery requests will appear here.",
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
