import 'dart:convert';

import 'package:event_application/bloc/event/event_bloc.dart';
import 'package:event_application/models/event_form_model.dart';
import 'package:event_application/models/event_model.dart';
import 'package:event_application/services/auth_service.dart';
import 'package:http/http.dart' as http;

class EventService {
  final String baseUrl = 'http://localhost:3000/api/v1';

  Future<List<EventModel>> getAllvent() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/events'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print(token);

      if (res.statusCode == 200) {
        List<EventModel> datas = List<EventModel>.from(
          jsonDecode(res.body)['data'].map(
            (data) => EventModel.fromJson(data),
          ),
        ).toList();

        print(res.body);

        return datas;
      }
      return throw jsonDecode(res.body)['message'];
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<EventModel>> getAllEventCategory(String category) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/events/admin?category=$category'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print(token);

      if (res.statusCode == 200) {
        List<EventModel> datas = List<EventModel>.from(
          jsonDecode(res.body)['data'].map(
            (data) => EventModel.fromJson(data),
          ),
        ).toList();
        print(res.body);

        return datas;
      }
      return throw jsonDecode(res.body)['message'];
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<EventModel>> getAllEventAdmin(String user) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/events/admin?user=$user'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print(user);
      print(token);

      if (res.statusCode == 200) {
        List<EventModel> datas = List<EventModel>.from(
          jsonDecode(res.body)['data'].map(
            (data) => EventModel.fromJson(data),
          ),
        ).toList();
        print(res.body);

        return datas;
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }

  // Future<void> createEvent(EventForm data) async {
  //   try {
  //     print(data.toJson());
  //     final token = await AuthService().getToken();

  //     // final req = await http.MultipartRequest(
  //     //   'POST',
  //     //   Uri.parse('$baseUrl/events'),
  //     // );
  //     // req.headers.addAll(<String, String>{'Authorization': 'Bearer $token'});
  //     // req.fields['title'] = data.title!;
  //     // req.fields['about'] = data.about!;
  //     // req.fields['location'] = data.location!;
  //     // req.fields['date'] = data.date!;
  //     //req.fields['category'] = data.category!.toHexString();

  //     // Add image file
  //     var mimeType = lookupMimeType(data.cover!.path);
  //     var file = await http.MultipartFile.fromPath('cover', data.cover!.path,
  //         filename: data.cover!.path.split('/').last,
  //         contentType: MediaType.parse(mimeType ?? 'image/jpg'));
  //     print(data.cover!.path);

  //     //req.files.add(file);
  //     var res = await http.post(
  //       Uri.parse('$baseUrl/events'),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //         'Content-Type': 'application/json; charset=utf-8'
  //       },
  //     );

  //     print(token);
  //     print(res.statusCode);

  //     if (res.statusCode == 200 || res.statusCode == 201) {
  //       print('success');
  //       final user = jsonDecode(res.body);
  //       print(user);
  //       print(res.body);
  //       return user;
  //     }
  //     // /throw ['message'];
  //     throw jsonDecode(res.body)['message'];
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }

  Future<EventForm> createEvent(EventForm data) async {
    try {
      print(data.toJson());
      final token = await AuthService().getToken();
      // var mimeType = lookupMimeType(data.cover!.path);
      // var file = await http.MultipartFile.fromPath('cover', data.cover!.path,
      //     filename: data.cover!.path.split('/').last,
      //     contentType: MediaType.parse(mimeType ?? 'image/jpg'));
      // print(data.cover!.path);
      // final req = await http.MultipartRequest(
      //   'POST',
      //   Uri.parse('$baseUrl/events'),
      // );
      // req.files.add(file);
      //var response = await req.send();
      //print(response.contentLength);

      final res = await http.post(
        Uri.parse('$baseUrl/events/upload'),
        body: data.toJson(),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print(token);
      print(res.statusCode);
      print(res.body);

      if (res.statusCode == 200 || res.statusCode == 201) {
        final user = EventForm.fromJson(jsonDecode(res.body));
        return user;
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<EventForm> updateEvent(String eventid, EventForm data) async {
    try {
      print(data.toJson());
      final token = await AuthService().getToken();

      final res = await http.put(
        Uri.parse('$baseUrl/events/$eventid/upload'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: data.toJson(),
      );
      print(token);
      print(res.statusCode);
      print('category ${data.category}');
      print(res.body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        final user = EventForm.fromJson(jsonDecode(res.body));

        return user;
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Category>> getAllCategory() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/categories'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print(token);

      if (res.statusCode == 200) {
        List<Category> datas = List<Category>.from(
          jsonDecode(res.body)['data'].map(
            (data) => Category.fromJson(data),
          ),
        ).toList();
        print(res.body);

        return datas;
      }
      return throw jsonDecode(res.body)['message'];
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  var data = [];
  List<EventModel> results = [];

  Future<List<EventModel>> getuserList({String? query}) async {
    var url = Uri.parse('$baseUrl/events');
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/events/admin?keyword=$query'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (res.statusCode == 200) {
        List<EventModel> datas = List<EventModel>.from(
          jsonDecode(res.body)['data'].map(
            (data) => EventModel.fromJson(data),
          ),
        ).toList();
        if (query != null) {
          results = results
              .where((element) =>
                  element.title!.toLowerCase().contains((query.toLowerCase())))
              .toList();
        }
        return datas;
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}
