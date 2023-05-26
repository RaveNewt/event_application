import 'package:event_application/models/user_model.dart';

class EventModel {
  String? id;
  String? title;
  int? price;
  String? about;
  String? location;
  String? cover;
  String? date;
  int? stock;
  Category? category;
  Speaker? speaker;
  String? createdAt;
  String? updatedAt;

  EventModel({
    this.id,
    this.title,
    this.price,
    this.about,
    this.cover,
    this.location,
    this.date,
    this.category,
    this.speaker,
    this.createdAt,
    this.updatedAt,
    this.stock,
  });

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    price = json['price'];
    about = json['about'];
    cover = json['cover'];

    location = json['location'];
    date = json['date'];
    stock = json['stock'];
    category = Category.fromJson(json['category']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['price'] = price;
    data['cover'] = cover;
    data['about'] = about;
    data['location'] = location;
    data['date'] = date;
    data['stock'] = stock;
    data['category'] = category!.toJson();
    return data;
  }
}

class Category {
  String? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    return data;
  }
}

class Speaker {
  String? id;
  String? name;
  String? avatar;
  String? role;
  String? foto;

  Speaker({
    this.id,
    this.name,
    this.avatar,
    this.role,
  });
  Speaker.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    avatar = json['avatar'];
    role = json['role'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['avatar'] = avatar;
    data['role'] = role;
    return data;
  }
}
