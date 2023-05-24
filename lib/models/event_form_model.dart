import 'dart:io';

import 'package:event_application/models/event_model.dart';
import 'package:mongo_dart/mongo_dart.dart';

class EventForm {
  String? title;
  String? about;
  String? price;
  String? location;
  String? cover;
  String? date;
  String? category;

  EventForm.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    about = json['about'];
    cover = json['cover'];

    price = json['price'];
    location = json['location'];
    date = json['date'];
    category = json['category'];
  }
  EventForm(
      {this.title,
      this.about,
      this.price,
      this.cover,
      this.location,
      this.date,
      this.category});
  EventForm copyWith({
    String? title,
    String? about,
    String? price,
    String? cover,
    String? location,
    String? date,
    String? category,
  }) =>
      EventForm(
        title: title ?? this.title,
        about: about ?? this.about,
        price: this.price,
        cover: this.cover,
        location: location ?? this.location,
        date: date ?? this.date,
        category: this.category,
      );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'about': about,
      'price': price,
      'cover': cover,
      'location': location,
      'date': date,
      'category': category.toString(),
    };
  }
}
