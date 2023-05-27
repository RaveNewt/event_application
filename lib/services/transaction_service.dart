import 'dart:convert';

import 'package:event_application/models/checkout_form.dart';
import 'package:event_application/models/transaction_model.dart';
import 'package:event_application/services/auth_service.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  final String baseUrl = 'http://localhost:3000/api/v1';

  Future<TransactionModel> checkout(CheckoutForm data) async {
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
        final user = TransactionModel.fromJson(jsonDecode(res.body));
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
