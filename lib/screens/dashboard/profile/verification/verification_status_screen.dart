import 'package:flutter/material.dart';
import 'package:my_app/utils/app_colors.dart';

class VerificationStatusScreen extends StatelessWidget {
  const VerificationStatusScreen({super.key});

  final List<Map<String, dynamic>> verificationItems = const [
    {
      'title': 'Mobile Number',
      'subtitle': 'Your mobile number has been verified',
      'status': 'Verified',
      'icon': Icons.phone_android,
      'verified': true,
    },
    {
      'title': 'Personal Information',
      'subtitle': 'Your personal details have been verified',
      'status': 'Verified',
      'icon': Icons.person,
      'verified': true,
    },
    {
      'title': 'Driving Licence',
      'subtitle': 'Upload your valid driving licence',
      'status': 'Pending',
      'icon': Icons.badge,
      'verified': false,
    },
    {
      'title': 'Vehicle RC',
      'subtitle': 'Upload your vehicle registration certificate',
      'status': 'Pending',
      'icon': Icons.two_wheeler,
      'verified': false,
    },
    {
      'title': 'Bank Account',
      'subtitle': 'Your bank account details need verification',
      'status': 'Pending',
      'icon': Icons.account_balance,
      'verified': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final int completedCount = verificationItems
        .where((item) => item['verified'] == true)
        .length;

    final int totalCount = verificationItems.length;
    final double progress = completedCount / totalCount;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Verification Status'),
        backgroundColor: AppColors.yellow,
        foregroundColor: AppColors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Verification Summary
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: AppColors.yellow,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.verified_user,
                  size: 55,
                  color: AppColors.black,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Verification Progress',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$completedCount of $totalCount completed',
                  style: const TextStyle(color: AppColors.black, fontSize: 14),
                ),
                const SizedBox(height: 18),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 10,
                    backgroundColor: AppColors.white,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${(progress * 100).round()}% Completed',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Verification Checklist',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),

          const SizedBox(height: 12),

          ...verificationItems.map((item) {
            final bool isVerified = item['verified'] as bool;

            return Card(
              color: AppColors.white,
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding: const EdgeInsets.all(14),
                leading: CircleAvatar(
                  backgroundColor: isVerified
                      ? AppColors.green.withValues(alpha: 0.12)
                      : AppColors.yellow.withValues(alpha: 0.25),
                  child: Icon(item['icon'] as IconData, color: AppColors.black),
                ),
                title: Text(
                  item['title'] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    item['subtitle'] as String,
                    style: const TextStyle(fontSize: 12, color: AppColors.grey),
                  ),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isVerified ? Icons.check_circle : Icons.pending_outlined,
                      color: isVerified ? AppColors.green : Colors.orange,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['status'] as String,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: isVerified ? AppColors.green : Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),

          const SizedBox(height: 12),

          Card(
            color: AppColors.white,
            elevation: 0,
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, color: AppColors.black),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Complete all verification steps to become eligible for delivery assignments. Contact support if you need assistance.',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.grey,
                        height: 1.5,
                      ),
                    ),
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
