import 'package:sssss/data/helpers/api.dart';
import 'package:sssss/data/models/user_authentication.dart';

class UserLogIn {
  Future<UserAuthentication> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic> data = await Api().post(
        url: 'https://docfinder.alkyall.com/public/api/login',
        body: {
          'email': email,
          'password': password,
        },
      );

      print(
          "Full API Response for User: ${data.toString()}"); 

      if (data.containsKey('error')) {
        throw Exception(data['error']);
      }

      return UserAuthentication.fromJson(data);
    } catch (e) {
      print("User Login Failed: ${e.toString()}"); // ✅ طباعة الخطأ
      throw Exception("Login failed: ${e.toString()}");
    }
  }
}
