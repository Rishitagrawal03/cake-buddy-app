import 'package:flutter/material.dart';
import 'package:my_app/utils/app_colors.dart';

class BankDetailsScreen extends StatelessWidget {
  const BankDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Bank Details'),
        backgroundColor: AppColors.yellow,
        foregroundColor: AppColors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Bank Header
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.yellow,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              children: [
                Icon(Icons.account_balance, size: 55, color: AppColors.black),
                SizedBox(height: 12),
                Text(
                  'Bank Account Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Manage your payment details',
                  style: TextStyle(color: AppColors.black, fontSize: 13),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Account Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),

          const SizedBox(height: 12),

          const _BankInfoTile(
            title: 'Account Holder Name',
            value: 'Rahul Kumar',
            icon: Icons.person,
          ),

          const _BankInfoTile(
            title: 'Bank Name',
            value: 'State Bank of India',
            icon: Icons.account_balance,
          ),

          const _BankInfoTile(
            title: 'Account Number',
            value: 'XXXX XXXX 1234',
            icon: Icons.credit_card,
          ),

          const _BankInfoTile(
            title: 'IFSC Code',
            value: 'SBIN0001234',
            icon: Icons.numbers,
          ),

          const _BankInfoTile(
            title: 'UPI ID',
            value: 'rahulkumar@upi',
            icon: Icons.payment,
          ),

          const SizedBox(height: 24),

          // Verification Status
          Card(
            color: AppColors.white,
            elevation: 0,
            child: const ListTile(
              leading: Icon(
                Icons.verified_user,
                color: AppColors.green,
                size: 28,
              ),
              title: Text(
                'Bank Account Verification',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              subtitle: Text('Verification Pending'),
              trailing: Icon(Icons.pending_outlined, color: Colors.orange),
            ),
          ),

          const SizedBox(height: 24),

          // Update Button
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.yellow,
              foregroundColor: AppColors.black,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Bank details update will be connected to API.',
                  ),
                ),
              );
            },
            icon: const Icon(Icons.edit),
            label: const Text(
              'Update Bank Details',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'Your bank details are used for transferring your delivery earnings.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}

class _BankInfoTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _BankInfoTile({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: AppColors.black),
        title: Text(
          title,
          style: const TextStyle(color: AppColors.grey, fontSize: 13),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            value,
            style: const TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
