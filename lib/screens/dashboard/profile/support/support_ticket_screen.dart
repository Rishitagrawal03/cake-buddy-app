import 'package:flutter/material.dart';
import 'package:my_app/utils/app_colors.dart';

class SupportTicketScreen extends StatefulWidget {
  const SupportTicketScreen({super.key});

  @override
  State<SupportTicketScreen> createState() => _SupportTicketScreenState();
}

class _SupportTicketScreenState extends State<SupportTicketScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController subjectController = TextEditingController();

  final TextEditingController messageController = TextEditingController();

  String selectedCategory = 'Order Related';

  final List<String> categories = [
    'Order Related',
    'Payment Related',
    'Account Related',
    'Vehicle Related',
    'Technical Issue',
    'Other',
  ];

  void submitTicket() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // TODO: Connect this form to the Spring Boot support ticket API.

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Ticket Submitted'),
        content: const Text(
          'Your support request has been submitted successfully.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              Navigator.pop(context);
            },
            child: const Text(
              'OK',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    subjectController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Raise Support Ticket'),
        backgroundColor: AppColors.yellow,
        foregroundColor: AppColors.black,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
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
                  Icon(Icons.support_agent, size: 50, color: AppColors.black),
                  SizedBox(height: 10),
                  Text(
                    'How can we assist you?',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Submit your issue and our support team can assist you.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.black, fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Issue Category',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: categories.map((category) {
                return DropdownMenuItem(value: category, child: Text(category));
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedCategory = value;
                  });
                }
              },
            ),

            const SizedBox(height: 20),

            const Text(
              'Subject',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 8),

            TextFormField(
              controller: subjectController,
              decoration: InputDecoration(
                hintText: 'Enter issue subject',
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a subject';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            const Text(
              'Description',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 8),

            TextFormField(
              controller: messageController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Describe your issue in detail...',
                alignLabelWithHint: true,
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please describe your issue';
                }
                if (value.trim().length < 10) {
                  return 'Description must be at least 10 characters';
                }
                return null;
              },
            ),

            const SizedBox(height: 28),

            SizedBox(
              height: 52,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.yellow,
                  foregroundColor: AppColors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: submitTicket,
                icon: const Icon(Icons.send),
                label: const Text(
                  'Submit Ticket',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
