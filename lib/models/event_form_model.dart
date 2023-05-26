class EventForm {
  String? title;
  String? about;
  String? price;
  String? location;
  String? cover;
  String? date;
  String? category;
  String? stock;

  EventForm.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    about = json['about'];
    cover = json['cover'];
    cover = json['stock'];

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
      this.stock,
      this.location,
      this.date,
      this.category});
  EventForm copyWith({
    String? title,
    String? about,
    String? price,
    String? cover,
    String? stock,
    String? location,
    String? date,
    String? category,
  }) =>
      EventForm(
        title: title ?? this.title,
        about: about ?? this.about,
        price: this.price,
        cover: this.cover,
        stock: this.stock,
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
      'stock': stock,
      'location': location,
      'date': date,
      'category': category.toString(),
    };
  }
}
