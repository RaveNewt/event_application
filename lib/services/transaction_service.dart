import 'dart:convert';

import 'package:event_application/models/checkout_form.dart';
import 'package:event_application/models/login_model.dart';
import 'package:event_application/models/register_model.dart';
import 'package:event_application/models/transaction_model.dart';
import 'package:event_application/models/user_model.dart';
import 'package:event_application/services/auth_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  final String baseUrl = 'http://localhost:3000/api/v1';

  Future<CheckoutForm> checkout(CheckoutForm data) async {
    try {
      print(data.toJson());
      final token = await AuthService().getToken();
      final res = await http.post(
        Uri.parse(
          '$baseUrl/participants/checkout',
        ),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: data.toJson(),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final user = CheckoutForm.fromJson(jsonDecode(res.body)['data']);
        print(user);
        print(res.body);

        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
