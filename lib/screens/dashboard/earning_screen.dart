import 'package:flutter/material.dart';

class EarningsScreen extends StatelessWidget {
  final double todayEarnings;
  final int ordersToday;
  final double hoursOnline;

  const EarningsScreen({
    super.key,
    required this.todayEarnings,
    required this.ordersToday,
    required this.hoursOnline,
  });

  static const Color _yellow = Color(0xFFFFC300);
  static const Color _black = Color(0xFF1A1A1A);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Earnings",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: _black,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Today's Earnings",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 10),
                Text(
                  "₹${todayEarnings.toStringAsFixed(0)}",
                  style: const TextStyle(
                    color: _yellow,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "$ordersToday orders completed",
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          const Text(
            "Earnings Summary",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 14),

          _earningRow(
            Icons.currency_rupee,
            "Today's earnings",
            "₹${todayEarnings.toStringAsFixed(0)}",
          ),
          _earningRow(
            Icons.delivery_dining,
            "Completed orders",
            "$ordersToday",
          ),
          _earningRow(
            Icons.access_time,
            "Online hours",
            "${hoursOnline.toStringAsFixed(1)} hours",
          ),

          const SizedBox(height: 20),
          const Text(
            "Payment Information",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Row(
              children: [
                Icon(Icons.account_balance, size: 28),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Bank account details\nManage your payout account",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Icon(Icons.chevron_right),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _earningRow(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: _black),
          const SizedBox(width: 12),
          Expanded(child: Text(title)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
