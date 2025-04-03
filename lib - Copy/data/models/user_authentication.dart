class UserAuthentication {
  final String email;
  final String username;
  final String location;
  final String phone;
  final String birthDate;
  final String? role;
  final String? token;
  final bool success;
  final String? message;
  UserAuthentication({
    this.message,
    required this.success,
    required this.email,
    required this.username,
    required this.location,
    required this.phone,
    required this.birthDate,
    this.role,
    this.token,
  });

  factory UserAuthentication.fromJson(Map<String, dynamic> jsonData) {
    print("User Data: $jsonData"); // ✅ طباعة كل البيانات القادمة من API

    return UserAuthentication(
      email: jsonData['email'] ?? '',
      username: jsonData['username'] ?? '',
      phone: jsonData['phone'] ?? '',
      location: jsonData['location'] ?? '',
      birthDate: jsonData['birth_date'] ?? '',
      role: jsonData['role']?.toString(), // تحويلها إلى String
      token: jsonData['token'] ?? '',
      message: jsonData['message'] ?? '',
      success: jsonData['success'] ?? false,
    );
  }
}
