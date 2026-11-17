import 'package:flutter/material.dart';
import 'package:my_app/utils/app_colors.dart';
import 'faq_screen.dart';
import 'support_ticket_screen.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  void _showContactDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Close',
              style: TextStyle(color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Help & Support'),
        backgroundColor: AppColors.yellow,
        foregroundColor: AppColors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Support Header
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.yellow,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              children: [
                Icon(Icons.support_agent, size: 60, color: AppColors.black),
                SizedBox(height: 12),
                Text(
                  'How can we help you?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'We are here to support you with your deliveries.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.black, fontSize: 13),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Support Options',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),

          const SizedBox(height: 12),

          _SupportTile(
            icon: Icons.help_outline,
            title: 'Frequently Asked Questions',
            subtitle: 'Find answers to common questions',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FaqScreen()),
              );
            },
          ),

          _SupportTile(
            icon: Icons.confirmation_number_outlined,
            title: 'Raise a Support Ticket',
            subtitle: 'Report an issue or request assistance',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SupportTicketScreen(),
                ),
              );
            },
          ),

          _SupportTile(
            icon: Icons.phone_outlined,
            title: 'Call Support',
            subtitle: 'Speak with our support team',
            onTap: () {
              _showContactDialog(
                context,
                'Call Support',
                'Customer support phone number will be available here.',
              );
            },
          ),

          _SupportTile(
            icon: Icons.email_outlined,
            title: 'Email Support',
            subtitle: 'Send us your questions by email',
            onTap: () {
              _showContactDialog(
                context,
                'Email Support',
                'Customer support email address will be available here.',
              );
            },
          ),

          const SizedBox(height: 24),

          // Support Information
          Card(
            color: AppColors.white,
            elevation: 0,
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(Icons.access_time, color: AppColors.black, size: 30),
                  SizedBox(height: 10),
                  Text(
                    'Support Availability',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Our support team is available to help you with delivery-related issues.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SupportTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SupportTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(14),
        leading: CircleAvatar(
          backgroundColor: AppColors.yellow,
          child: Icon(icon, color: AppColors.black),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            subtitle,
            style: const TextStyle(color: AppColors.grey, fontSize: 12),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: AppColors.black,
        ),
        onTap: onTap,
      ),
    );
  }
}
