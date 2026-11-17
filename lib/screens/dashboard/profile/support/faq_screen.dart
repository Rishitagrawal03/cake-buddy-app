import 'package:flutter/material.dart';
import 'package:my_app/utils/app_colors.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  final List<Map<String, String>> faqs = const [
    {
      'question': 'How can I accept a delivery request?',
      'answer':
          'When a new delivery request appears on your dashboard, tap Accept to accept the order.',
    },
    {
      'question': 'How can I go online or offline?',
      'answer':
          'Open your home dashboard and use the Online/Offline toggle to change your availability.',
    },
    {
      'question': 'How can I check my earnings?',
      'answer':
          'Open the Earnings section from the bottom navigation bar to view your daily and total earnings.',
    },
    {
      'question': 'When will I receive my payment?',
      'answer':
          'Your delivery earnings will be transferred according to the payment schedule configured by CakeBuddy.',
    },
    {
      'question': 'How can I update my bank details?',
      'answer':
          'Go to Profile, open Bank Details, and use the Update Bank Details option.',
    },
    {
      'question': 'What should I do if an order is cancelled?',
      'answer':
          'Check the order status in your Orders section. If you need assistance, raise a support ticket.',
    },
    {
      'question': 'What if I cannot complete a delivery?',
      'answer':
          'Contact the support team and explain the issue before taking further action.',
    },
    {
      'question': 'How can I contact CakeBuddy support?',
      'answer':
          'Open Profile > Help & Support and choose Raise a Support Ticket.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Frequently Asked Questions'),
        backgroundColor: AppColors.yellow,
        foregroundColor: AppColors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.yellow,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              children: [
                Icon(Icons.quiz_outlined, size: 50, color: AppColors.black),
                SizedBox(height: 10),
                Text(
                  'How can we help you?',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Find answers to common rider questions.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.black),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Common Questions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 12),
          ...faqs.map(
            (faq) => Card(
              color: AppColors.white,
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 10),
              child: ExpansionTile(
                iconColor: AppColors.black,
                collapsedIconColor: AppColors.black,
                title: Text(
                  faq['question']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                    fontSize: 14,
                  ),
                ),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      faq['answer']!,
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontSize: 13,
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
