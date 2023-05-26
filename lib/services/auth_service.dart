import 'dart:convert';

import 'package:event_application/models/login_model.dart';
import 'package:event_application/models/register_model.dart';
import 'package:event_application/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http://localhost:3000/api/v1';

  Future<UserModel> register(RegisterFormModel data) async {
    try {
      print(data.toJson());
      final res = await http.post(
        Uri.parse(
          '$baseUrl/auth/signup',
        ),
        body: data.toJson(),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final user = UserModel.fromJson(jsonDecode(res.body));
        user.user!.password = data.password;
        print(user);
        print(res.body);
        await storeCredentialToLocal(user);

        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<UserModel> login(LoginFormModel data) async {
    try {
      final token = await getToken();
      print(data.toJson());
      final res = await http.post(
        Uri.parse(
          '$baseUrl/auth/signin',
        ),
        body: data.toJson(),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final user = UserModel.fromJson(jsonDecode(res.body));
        user.user!.password = data.password;

        print(user.token);

        print(res.body);
        await storeCredentialToLocal(user);

        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      final token = await getToken();
      final res = await http.post(
        Uri.parse(
          '$baseUrl/auth/logout',
        ),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        await clearLocalStorage();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> storeCredentialToLocal(UserModel user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: user.token);
      await storage.write(key: 'email', value: user.user!.email);
      await storage.write(key: 'password', value: user.user!.password);
      print('store user to local: ${user.toJson()}');
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    String token = '';

    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'token');

    if (value != null) {
      token = value;
    }

    return token;
  }

  Future<LoginFormModel> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, String> values = await storage.readAll();

      if (values['token'] != null) {
        final LoginFormModel data = LoginFormModel(
          email: values['email'],
          password: values['password'],
        );

        print('get user from local: ${data.toJson()}');

        return data;
      } else {
        throw 'unauthenticated';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> clearLocalStorage() async {
    try {
      const storage = FlutterSecureStorage();
      await storage.deleteAll();
    } catch (e) {
      rethrow;
    }
  }
}
