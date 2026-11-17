import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';
import 'profile/personal_info/personal_info_screen.dart';
import 'profile/vehicle_info/vehicle_info_screen.dart';
import 'profile/bank_details/bank_details_screen.dart';
import 'profile/verification/verification_status_screen.dart';
import 'profile/notifications/notification_screen.dart';
import 'profile/support/help_support_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;
  bool isOnline = false;

  double todayEarnings = 845;
  int completedOrders = 7;
  double onlineHours = 3.4;

  final List<Map<String, dynamic>> orders = [
    {
      'id': 'CB1001',
      'customer': 'Amit Sharma',
      'address': 'Sector 18, Noida',
      'items': 'Birthday Gift Hamper',
      'amount': 120,
      'distance': '2.5 km',
      'status': 'NEW',
    },
    {
      'id': 'CB1002',
      'customer': 'Priya Verma',
      'address': 'Sector 62, Noida',
      'items': 'Anniversary Decoration',
      'amount': 150,
      'distance': '3.8 km',
      'status': 'NEW',
    },
  ];

  final List<Map<String, dynamic>> completedOrderList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CakeBuddy Rider',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              'Delivery Partner',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Colors.black),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          _homeScreen(),
          _ordersScreen(),
          _earningsScreen(),
          _profileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            activeIcon: Icon(Icons.receipt_long),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            activeIcon: Icon(Icons.account_balance_wallet),
            label: 'Earnings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // HOME SCREEN
  Widget _homeScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _onlineStatusCard(),
          const SizedBox(height: 20),

          const Text(
            "Today's Overview",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _statCard(
                  'Earnings',
                  '₹${todayEarnings.toStringAsFixed(0)}',
                  Icons.currency_rupee,
                  Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _statCard(
                  'Completed',
                  '$completedOrders',
                  Icons.check_circle_outline,
                  Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _statCard(
                  'Online Hours',
                  '${onlineHours}h',
                  Icons.access_time,
                  Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _statCard(
                  'New Orders',
                  '${orders.length}',
                  Icons.shopping_bag_outlined,
                  Colors.purple,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'New Delivery Requests',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  setState(() => selectedIndex = 1);
                },
                child: const Text('View All'),
              ),
            ],
          ),

          if (!isOnline)
            _emptyState(
              Icons.wifi_off,
              'You are Offline',
              'Go online to receive new delivery requests.',
            )
          else if (orders.isEmpty)
            _emptyState(
              Icons.delivery_dining,
              'No New Orders',
              'New delivery requests will appear here.',
            )
          else
            ...orders.map((order) => _orderCard(order)),
        ],
      ),
    );
  }

  Widget _onlineStatusCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isOnline ? Colors.green : Colors.blueGrey,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.delivery_dining, color: Colors.white, size: 32),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isOnline ? 'You are Online' : 'You are Offline',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isOnline
                          ? 'You can receive delivery requests now.'
                          : 'Go online to start receiving orders.',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isOnline = !isOnline;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: isOnline ? Colors.red : Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                isOnline ? 'GO OFFLINE' : 'GO ONLINE',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  // ORDERS SCREEN
  Widget _ordersScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Orders',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          const Text(
            'Available Orders',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          if (orders.isEmpty)
            _emptyState(
              Icons.inbox_outlined,
              'No Available Orders',
              'New orders will appear here.',
            )
          else
            ...orders.map((order) => _orderCard(order)),

          const SizedBox(height: 20),
          const Text(
            'Completed Deliveries',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          if (completedOrderList.isEmpty)
            const Text(
              'No completed deliveries yet.',
              style: TextStyle(color: Colors.grey),
            )
          else
            ...completedOrderList.map((order) => _completedOrderCard(order)),
        ],
      ),
    );
  }

  Widget _orderCard(Map<String, dynamic> order) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '#${order['id']}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '₹${order['amount']}',
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          Text(
            order['customer'],
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(order['items'], style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.red, size: 18),
              const SizedBox(width: 5),
              Expanded(child: Text(order['address'])),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.route, color: Colors.blue, size: 18),
              const SizedBox(width: 5),
              Text(order['distance']),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isOnline ? () => _acceptOrder(order) : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 13),
              ),
              child: const Text('ACCEPT DELIVERY'),
            ),
          ),
          if (!isOnline)
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                'Go online to accept orders.',
                style: TextStyle(color: Colors.orange, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  void _acceptOrder(Map<String, dynamic> order) {
    setState(() {
      orders.remove(order);
      completedOrderList.add({...order, 'status': 'ACCEPTED'});
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Order accepted successfully')),
    );
  }

  Widget _completedOrderCard(Map<String, dynamic> order) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#${order['id']}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(order['customer']),
              ],
            ),
          ),
          Text(
            '₹${order['amount']}',
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // EARNINGS SCREEN
  Widget _earningsScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Earnings',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                const Text(
                  "Today's Earnings",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(
                  '₹${todayEarnings.toStringAsFixed(0)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          _earningRow('Completed Deliveries', '$completedOrders'),
          _earningRow('Online Hours', '${onlineHours} hours'),
          _earningRow(
            'Average Per Delivery',
            completedOrders == 0
                ? '₹0'
                : '₹${(todayEarnings / completedOrders).toStringAsFixed(0)}',
          ),
          _earningRow('Payment Status', 'Demo Data'),
        ],
      ),
    );
  }

  Widget _earningRow(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // PROFILE SCREEN

  Widget _profileScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 20),

          const CircleAvatar(
            radius: 48,
            backgroundColor: Color(0xFFE5F5E9),
            child: Icon(Icons.person, size: 55, color: Colors.green),
          ),

          const SizedBox(height: 12),

          const Text(
            'Rider Profile',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),

          const Text('Delivery Partner', style: TextStyle(color: Colors.grey)),

          const SizedBox(height: 25),

          _profileOption(
            Icons.person_outline,
            'Personal Information',
            () => _openProfilePage(const PersonalInfoScreen()),
          ),

          _profileOption(
            Icons.two_wheeler,
            'Vehicle Information',
            () => _openProfilePage(const VehicleInfoScreen()),
          ),

          _profileOption(
            Icons.account_balance,
            'Bank Details',
            () => _openProfilePage(const BankDetailsScreen()),
          ),

          _profileOption(
            Icons.verified_user_outlined,
            'Verification Status',
            () => _openProfilePage(const VerificationStatusScreen()),
          ),

          _profileOption(
            Icons.notifications_outlined,
            'Notifications',
            () => _openProfilePage(const NotificationsScreen()),
          ),

          _profileOption(
            Icons.support_agent,
            'Help & Support',
            () => _openProfilePage(const HelpSupportScreen()),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: _logout,
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text('Logout', style: TextStyle(color: Colors.red)),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                side: const BorderSide(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openProfilePage(Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }

  Widget _profileOption(IconData icon, String title, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF1A1A1A)),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  Widget _emptyState(IconData icon, String title, String subtitle) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, size: 45, color: Colors.grey),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }
}
