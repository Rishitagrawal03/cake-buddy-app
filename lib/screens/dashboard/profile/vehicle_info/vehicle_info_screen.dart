import 'package:flutter/material.dart';
import 'package:my_app/utils/app_colors.dart';

class VehicleInfoScreen extends StatelessWidget {
  const VehicleInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Vehicle Information'),
        backgroundColor: AppColors.yellow,
        foregroundColor: AppColors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Vehicle Icon
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.yellow,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              children: [
                Icon(Icons.two_wheeler, size: 65, color: AppColors.black),
                SizedBox(height: 10),
                Text(
                  'Registered Vehicle',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Vehicle Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),

          const SizedBox(height: 12),

          const _VehicleInfoTile(
            title: 'Vehicle Type',
            value: 'Two Wheeler',
            icon: Icons.two_wheeler,
          ),

          const _VehicleInfoTile(
            title: 'Vehicle Brand',
            value: 'Honda',
            icon: Icons.directions_bike,
          ),

          const _VehicleInfoTile(
            title: 'Vehicle Model',
            value: 'Honda Activa',
            icon: Icons.motorcycle,
          ),

          const _VehicleInfoTile(
            title: 'Registration Number',
            value: 'UP16 AB 1234',
            icon: Icons.confirmation_number,
          ),

          const _VehicleInfoTile(
            title: 'Driving Licence Number',
            value: 'UP0120200012345',
            icon: Icons.badge,
          ),

          const SizedBox(height: 20),

          const Text(
            'Document Status',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),

          const SizedBox(height: 12),

          const _DocumentTile(
            title: 'Driving Licence',
            status: 'Uploaded',
            isUploaded: true,
          ),

          const _DocumentTile(
            title: 'Vehicle RC',
            status: 'Uploaded',
            isUploaded: true,
          ),

          const _DocumentTile(
            title: 'Vehicle Insurance',
            status: 'Pending',
            isUploaded: false,
          ),

          const SizedBox(height: 24),

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
                    'Vehicle information editing will be connected to API.',
                  ),
                ),
              );
            },
            icon: const Icon(Icons.edit),
            label: const Text(
              'Update Vehicle Information',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class _VehicleInfoTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _VehicleInfoTile({
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

class _DocumentTile extends StatelessWidget {
  final String title;
  final String status;
  final bool isUploaded;

  const _DocumentTile({
    required this.title,
    required this.status,
    required this.isUploaded,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(Icons.description, color: AppColors.black),
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Text(
          status,
          style: TextStyle(
            color: isUploaded ? AppColors.green : Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
