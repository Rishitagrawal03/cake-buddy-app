import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) => const LoginScreen()),
              );
            },
          )
        ],
      ),
      body: const Center(
        child: Text("Welcome to Dashboard"),
      ),
    );
  }
}