import 'package:event_application/models/event_model.dart';

class TransactionModel {
  PersonalDetail? user;
  String? event;
  String? payment;

  TransactionModel({this.event, this.user, this.payment});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    event = json['historyEvent'];
    user =
        PersonalDetail.fromJson(json['personalDetail'] as Map<String, dynamic>);
    payment = json['payment'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['historyEvent'] = event;
    data['personalDetail'] = user!.toJson();
    data['payment'] = payment;
    return data;
  }
}

class PersonalDetail {
  String? id;
  String? username;
  String? email;
  String? password;
  String? role;

  PersonalDetail({
    this.id,
    this.username,
    this.email,
    this.role,
  });

  PersonalDetail.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    role = json['role'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['role'] = role;
    return data;
  }

  PersonalDetail.copyWith({
    String? username,
    String? email,
    String? password,
  }) {
    id = id;
    username = username ?? this.username;
    email = email ?? this.email;
    password = password ?? this.password;
    role = role ?? this.role;
  }
}
