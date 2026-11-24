class ApiConstants {
  // Android Emulator
  static const String baseUrl = 'http://localhost:9900';

  // Change 8080 if your Spring Boot backend uses another port.

  static const String customerUrl = '$baseUrl/api/customers';
  static const String productUrl = '$baseUrl/api/products';
  static const String categoryUrl = '$baseUrl/api/categories';
  static const String cartUrl = '$baseUrl/api/cart';
  static const String orderUrl = '$baseUrl/api/orders';
}
