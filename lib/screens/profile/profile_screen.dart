import 'package:cakebuddy_customer/widgets/profile_title.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('My Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 15),

          const CircleAvatar(
            radius: 42,
            backgroundColor: AppColors.lightGreen,
            child: Icon(Icons.person, size: 45, color: AppColors.darkGreen),
          ),

          const SizedBox(height: 12),

          const Center(
            child: Text(
              'Welcome to CakeBuddy!',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 25),

          ProfileTile(
            icon: Icons.person_outline,
            title: 'Personal Information',
            onTap: () {},
          ),

          ProfileTile(
            icon: Icons.location_on_outlined,
            title: 'My Addresses',
            onTap: () {},
          ),

          ProfileTile(
            icon: Icons.favorite_border,
            title: 'My Wishlist',
            onTap: () {},
          ),

          ProfileTile(
            icon: Icons.payment_outlined,
            title: 'Payment Methods',
            onTap: () {},
          ),

          ProfileTile(
            icon: Icons.help_outline,
            title: 'Help & Support',
            onTap: () {},
          ),

          ProfileTile(
            icon: Icons.info_outline,
            title: 'About CakeBuddy',
            onTap: () {},
          ),

          ProfileTile(icon: Icons.logout, title: 'Logout', onTap: () {}),
        ],
      ),
    );
  }
}
