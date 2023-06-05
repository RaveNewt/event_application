class TransactionModel {
  String? id;
  String? username;
  String? email;
  String? payment;
  String? title;
  String? ticketNumber;
  String? date;
  String? location;
  int? price;

  TransactionModel({
    this.id,
    this.username,
    this.email,
    this.title,
    this.price,
    this.payment,
    this.ticketNumber,
    this.date,
    this.location,
  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['personalDetail']['username'];
    email = json['personalDetail']['email'];
    title = json['historyEvent']['title'];
    ticketNumber = json['ticketNumber'];
    price = json['historyEvent']['price'];
    date = json['historyEvent']['date'];
    location = json['historyEvent']['location'];
    payment = json['payment'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['username'] = username;
    data['email'] = email;
    return data;
  }

  TransactionModel.copyWith({
    String? username,
    String? email,
    String? password,
  }) {
    id = id;
    username = username ?? this.username;
    email = email ?? this.email;
  }
}
