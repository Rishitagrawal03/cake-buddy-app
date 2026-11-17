import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  // Android Emulator -> use 10.0.2.2 instead of localhost.
  static const String baseUrl = 'http://localhost:9900';

  static const Duration timeoutDuration = Duration(seconds: 30);

  Future<Map<String, String>> _getHeaders({bool requiresAuth = false}) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (requiresAuth) {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('jwtToken');

      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return headers;
  }

  // GET API
  Future<dynamic> get(String endpoint, {bool requiresAuth = true}) async {
    final response = await http
        .get(
          Uri.parse('$baseUrl$endpoint'),
          headers: await _getHeaders(requiresAuth: requiresAuth),
        )
        .timeout(timeoutDuration);

    return _handleResponse(response);
  }

  // POST API
  Future<dynamic> post(
    String endpoint, {
    Map<String, dynamic>? body,
    bool requiresAuth = false,
  }) async {
    final response = await http
        .post(
          Uri.parse('$baseUrl$endpoint'),
          headers: await _getHeaders(requiresAuth: requiresAuth),
          body: jsonEncode(body ?? {}),
        )
        .timeout(timeoutDuration);

    return _handleResponse(response);
  }

  // PUT API
  Future<dynamic> put(
    String endpoint, {
    Map<String, dynamic>? body,
    bool requiresAuth = true,
  }) async {
    final response = await http
        .put(
          Uri.parse('$baseUrl$endpoint'),
          headers: await _getHeaders(requiresAuth: requiresAuth),
          body: jsonEncode(body ?? {}),
        )
        .timeout(timeoutDuration);

    return _handleResponse(response);
  }

  // PATCH API
  Future<dynamic> patch(
    String endpoint, {
    Map<String, dynamic>? body,
    bool requiresAuth = true,
  }) async {
    final response = await http
        .patch(
          Uri.parse('$baseUrl$endpoint'),
          headers: await _getHeaders(requiresAuth: requiresAuth),
          body: jsonEncode(body ?? {}),
        )
        .timeout(timeoutDuration);

    return _handleResponse(response);
  }

  // DELETE API
  Future<dynamic> delete(String endpoint, {bool requiresAuth = true}) async {
    final response = await http
        .delete(
          Uri.parse('$baseUrl$endpoint'),
          headers: await _getHeaders(requiresAuth: requiresAuth),
        )
        .timeout(timeoutDuration);

    return _handleResponse(response);
  }

  // Common response handler
  dynamic _handleResponse(http.Response response) {
    final responseBody = response.body;

    dynamic data;

    if (responseBody.isNotEmpty) {
      try {
        data = jsonDecode(responseBody);
      } catch (_) {
        data = responseBody;
      }
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    }

    String message = 'Something went wrong';

    if (data is Map<String, dynamic>) {
      message =
          data['message']?.toString() ?? data['error']?.toString() ?? message;
    } else if (data is String && data.isNotEmpty) {
      message = data;
    }

    throw Exception('HTTP ${response.statusCode}: $message');
  }

  // Save JWT token
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwtToken', token);
    await prefs.setBool('isLoggedIn', true);
  }

  // Logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwtToken');
    await prefs.remove('isLoggedIn');
    await prefs.remove('riderPhoneNumber');
  }
}
