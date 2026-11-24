class CustomerModel {
  final int id;
  final String name;
  final String phoneNumber;
  final String? email;
  final String? profileImage;

  CustomerModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    this.email,
    this.profileImage,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      name: json['name'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      email: json['email'],
      profileImage: json['profileImage'],
    );
  }
}
