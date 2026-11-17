import 'package:flutter/material.dart';

import 'personal_info/personal_info_screen.dart';
import 'vehicle_info/vehicle_info_screen.dart';
import 'bank_details/bank_details_screen.dart';
import 'verification/verification_status_screen.dart';
import 'notifications/notification_screen.dart';

import 'support/help_support_screen.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onLogout;

  const ProfileScreen({super.key, required this.onLogout});

  static const Color yellow = Color(0xFFFFC300);
  static const Color black = Color(0xFF1A1A1A);

  void _openScreen(BuildContext context, Widget screen) {
    Navigator.of(
      context,
      rootNavigator: true,
    ).push(MaterialPageRoute(builder: (context) => screen));
  }

  Future<void> _confirmLogout(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: yellow,
              foregroundColor: black,
            ),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      onLogout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 15),

          const CircleAvatar(
            radius: 48,
            backgroundColor: yellow,
            child: Text(
              "RK",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: black,
              ),
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            "Rahul Kumar",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),

          const Text(
            "CakeBuddy Delivery Partner",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 25),

          _profileOption(
            context,
            Icons.person_outline,
            "Personal Information",
            "View and update your details",
            () => _openScreen(context, const PersonalInfoScreen()),
          ),

          _profileOption(
            context,
            Icons.two_wheeler,
            "Vehicle Information",
            "Manage your vehicle details",
            () => _openScreen(context, const VehicleInfoScreen()),
          ),

          _profileOption(
            context,
            Icons.account_balance,
            "Bank Details",
            "Manage your payout account",
            () => _openScreen(context, const BankDetailsScreen()),
          ),

          _profileOption(
            context,
            Icons.verified_user_outlined,
            "Verification Status",
            "Check your account verification",
            () => _openScreen(context, const VerificationStatusScreen()),
          ),

          _profileOption(
            context,
            Icons.notifications_outlined,
            "Notifications",
            "Manage notifications",
            () => _openScreen(context, const NotificationsScreen()),
          ),

          _profileOption(
            context,
            Icons.help_outline,
            "Help & Support",
            "Contact CakeBuddy support",
            () => _openScreen(context, const HelpSupportScreen()),
          ),

          _profileOption(
            context,
            Icons.logout,
            "Logout",
            "Sign out from your account",
            () => _confirmLogout(context),
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _profileOption(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap, {
    Color color = black,
  }) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, color: color),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
