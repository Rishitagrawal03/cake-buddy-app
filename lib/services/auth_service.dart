import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {

  // 👉 Change this depending on platform
  final String baseUrl = "http://localhost:9900"; 
  // For Android emulator → http://10.0.2.2:9900


  Future<dynamic> register({
  required String name,
  required String password,
  String? email,
  String? phoneNumber,
  String? address,
  String? gender,
  String? dob, // format: yyyy-MM-dd
}) async {

  final url = Uri.parse('$baseUrl/auth/register');

  try {
    final Map<String, dynamic> body = {
      "name": name,
      "password": password,
    };

    // 👉 Add optional fields only if not null
    if (email != null && email.isNotEmpty) body["email"] = email;
    if (phoneNumber != null && phoneNumber.isNotEmpty) body["phoneNumber"] = phoneNumber;
    if (address != null && address.isNotEmpty) body["address"] = address;
    if (gender != null && gender.isNotEmpty) body["gender"] = gender;
    if (dob != null && dob.isNotEmpty) body["dob"] = dob;

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Register failed: ${response.body}");
    }

  } catch (e) {
    throw Exception("API error: $e");
  }
}

  Future<dynamic> login(String username) async {
    final url = Uri.parse('$baseUrl/auth/login');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "sub": username,
          "role": "ADMIN"
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Login failed: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("API error: $e");
    }
  }
}