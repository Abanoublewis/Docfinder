import 'package:sssss/data/helpers/api.dart';
import 'package:sssss/data/models/user_authentication.dart';

class UserRegister {
  Future<UserAuthentication> registerUser({
    required String email,
    required String username,
    required String location,
    required String phone,
    required String birthDate,
    required String password,
    required String passwordConfirmation,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://docfinder.alkyall.com/public/api/register',
      body: {
        'email': email,
        'username': username,
        'location': location,
        'phone': phone,
        'birth_date': birthDate,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
    );
    return UserAuthentication.fromJson(data);
  }
}
