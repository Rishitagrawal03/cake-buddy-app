import 'package:flutter/material.dart';
import 'package:my_app/utils/app_colors.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Personal Information'),
        backgroundColor: AppColors.yellow,
        foregroundColor: AppColors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(
            radius: 42,
            backgroundColor: AppColors.yellow,
            child: Icon(Icons.person, size: 45, color: AppColors.black),
          ),
          const SizedBox(height: 20),

          const _InfoTile(title: 'Full Name', value: 'Rahul Kumar'),
          const _InfoTile(title: 'Phone Number', value: '+91 9876543210'),
          const _InfoTile(title: 'Email', value: 'rahul@example.com'),
          const _InfoTile(title: 'Date of Birth', value: '10 September 2002'),
          const _InfoTile(title: 'Gender', value: 'Male'),
          const _InfoTile(title: 'Address', value: 'Noida, Uttar Pradesh'),

          const SizedBox(height: 20),

          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.yellow,
              foregroundColor: AppColors.black,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Personal information editing will be connected to API.',
                  ),
                ),
              );
            },
            icon: const Icon(Icons.edit),
            label: const Text('Edit Information'),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String title;
  final String value;

  const _InfoTile({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Colors.grey)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            value,
            style: const TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
