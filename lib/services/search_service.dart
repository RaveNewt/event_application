import 'dart:convert';

import 'package:event_application/models/checkout_form.dart';
import 'package:event_application/models/event_form_model.dart';
import 'package:event_application/models/event_model.dart';
import 'package:event_application/models/transaction_model.dart';
import 'package:event_application/services/auth_service.dart';
import 'package:http/http.dart' as http;

class SearchService {
  final String baseUrl = 'http://localhost:3000/api/v1';

  Future<List<EventModel>> searchNameEvent(String title) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
        Uri.parse(
          '$baseUrl/events/admin?keyword=$title',
        ),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print(res.statusCode);

      if (res.statusCode == 200 || res.statusCode == 201) {
        List<EventModel> datas = List<EventModel>.from(
          jsonDecode(res.body)['data'].map(
            (data) => EventModel.fromJson(data),
          ),
        ).toList();

        return datas;
      } else {
        return throw jsonDecode(res.body)['data'];
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
