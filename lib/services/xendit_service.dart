import 'dart:convert';

import 'package:event_application/models/xendit_form.dart';
import 'package:event_application/models/xendit_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class XenditService {
  final String baseUrl = 'https://api.xendit.co/v2/invoices';

  Future<XenditModel> invoice(XenditForm data) async {
    try {
      //String encodedString = base64.encode(utf8.encode(originalString));
      //print(encodedString);
      await dotenv.load();
      String key = dotenv.get('XENDIT_KEY');
      print(key);
      print(data.toJson());
      final res = await http.post(
        Uri.parse(
          '$baseUrl',
        ),
        headers: {
          'Authorization': 'Basic $key',
        },
        body: data.toJson(),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final user = XenditModel.fromJson(jsonDecode(res.body));
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
