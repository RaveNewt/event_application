class TransactionModel {
  String? id;
  String? username;
  String? email;
  String? payment;
  String? title;
  int? price;

  TransactionModel({
    this.id,
    this.username,
    this.email,
    this.title,
    this.price,
    this.payment,
  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['data']['_id'];
    username = json['data']['personalDetail']['username'];
    email = json['data']['personalDetail']['email'];
    title = json['data']['historyEvent']['title'];
    price = json['data']['historyEvent']['price'];
    payment = json['data']['payment'];
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
