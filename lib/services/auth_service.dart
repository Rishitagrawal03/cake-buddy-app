import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // Android Emulator
  final String baseUrl = "http://localhost:9900";

  // For physical Android device, use your computer's local IP.

  // SEND OTP
  Future<dynamic> sendOtp({required String phoneNumber}) async {
    final url = Uri.parse('$baseUrl/api/riders/auth/send-otp');

    final formattedPhone = phoneNumber.startsWith('+')
        ? phoneNumber
        : '+91$phoneNumber';

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"phoneNumber": formattedPhone}),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      throw Exception("Send OTP failed: ${response.body}");
    }
  }

  // VERIFY OTP
  Future<dynamic> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    final formattedPhone = phoneNumber.startsWith('+')
        ? phoneNumber
        : '+91$phoneNumber';

    final url = Uri.parse('$baseUrl/api/riders/auth/verify-otp');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"phoneNumber": formattedPhone, "otp": otp}),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    }

    throw Exception("OTP verification failed: ${response.body}");
  }

  // LOGOUT
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('jwtToken');
    await prefs.remove('isLoggedIn');
    await prefs.remove('riderPhoneNumber');
  }
}
