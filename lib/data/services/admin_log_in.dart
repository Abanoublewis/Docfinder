import 'package:sssss/data/helpers/api.dart';
import 'package:sssss/data/models/user_authentication.dart';

class AdminLogIn {
  Future<UserAuthentication> loginAdmin({
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic> data = await Api().post(
        url: 'https://docfinder.alkyall.com/public/api/admin/login',
        body: {
          'email': email,
          'password': password,
        },
      );

      print(
          "Full API Response for Admin: ${data.toString()}"); // ✅ طباعة كل بيانات الـ API

      if (data.containsKey('error')) {
        throw Exception(data['error']);
      }

      UserAuthentication user = UserAuthentication.fromJson(data);
      print("Token: ${user.token}"); // ✅ تحقق من أن التوكين يتم استقباله
      print("Role: ${user.role}"); // ✅ تحقق من الدور

      return user;
    } catch (e) {
      print("Admin Login Failed: ${e.toString()}"); // ✅ طباعة الخطأ
      throw Exception("Login failed: ${e.toString()}");
    }
  }
}
