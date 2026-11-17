
import 'package:flutter/material.dart';
import 'package:my_app/screens/dashboard/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_app/services/auth_service.dart';
import 'package:my_app/screens/dashboard/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService authService = AuthService();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  bool isLogin = true;
  bool isOtpSent = false;
  bool isLoading = false;

  @override
  void dispose() {
    phoneController.dispose();
    otpController.dispose();
    super.dispose();
  }

  Future<void> sendOtp() async {
    final phone = phoneController.text.trim();

    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(phone)) {
      _showMessage('Please enter a valid 10-digit mobile number');
      return;
    }

    setState(() => isLoading = true);

    try {
      await authService.sendOtp(phoneNumber: phone);

      setState(() {
        isOtpSent = true;
      });

      _showMessage('OTP sent successfully');
    } catch (e) {
      _showMessage('Unable to send OTP: $e');
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  Future<void> verifyOtp() async {
    final phone = phoneController.text.trim();
    final otp = otpController.text.trim();

    if (otp.length != 6) {
      _showMessage('Please enter a valid 6-digit OTP');
      return;
    }

    setState(() => isLoading = true);

    try {
      // Verify OTP through backend.
      await authService.verifyOtp(
        phoneNumber: phone,
        otp: otp,
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('riderPhoneNumber', phone);

      if (!mounted) return;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        ),
        (route) => false,
      );
    } catch (e) {
      _showMessage('OTP verification failed: $e');
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Icon(
                  Icons.delivery_dining,
                  size: 85,
                  color: Colors.green,
                ),

                const SizedBox(height: 15),

                const Text(
                  'CakeBuddy Rider',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  isLogin
                      ? 'Login to your rider account'
                      : 'Register as a delivery partner',
                  style: const TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 35),

                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mobile Number',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 10),

                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        enabled: !isOtpSent,
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(14),
                            child: Text(
                              '+91',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          hintText: 'Enter mobile number',
                          counterText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      if (isOtpSent) ...[
                        const SizedBox(height: 20),

                        const Text(
                          'Enter OTP',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 10),

                        TextField(
                          controller: otpController,
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          decoration: InputDecoration(
                            hintText: 'Enter 6-digit OTP',
                            counterText: '',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: isLoading
                              ? null
                              : isOtpSent
                                  ? verifyOtp
                                  : sendOtp,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  isOtpSent
                                      ? 'VERIFY OTP'
                                      : 'SEND OTP',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),

                      if (isOtpSent)
                        Center(
                          child: TextButton(
                            onPressed: isLoading
                                ? null
                                : () {
                                    setState(() {
                                      isOtpSent = false;
                                      otpController.clear();
                                    });
                                  },
                            child: const Text('Change Mobile Number'),
                          ),
                        ),

                      const SizedBox(height: 12),

                      Center(
                        child: TextButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  setState(() {
                                    isLogin = !isLogin;
                                    isOtpSent = false;
                                    phoneController.clear();
                                    otpController.clear();
                                  });
                                },
                          child: Text(
                            isLogin
                                ? "New rider? Register here"
                                : "Already registered? Login",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
