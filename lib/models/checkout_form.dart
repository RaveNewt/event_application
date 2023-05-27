class CheckoutForm {
  String? id;
  String? event;
  String? email;
  String? username;
  String? payment;

  CheckoutForm.fromJson(Map<String, dynamic> json) {
    event = json['event'];
    id = json['_id'];
    email = json['email'];
    username = json['username'];

    payment = json['payment'];
  }
  CheckoutForm({
    this.id,
    this.event,
    this.email,
    this.username,
    this.payment,
  });
  CheckoutForm copyWith({
    String? id,
    String? event,
    String? email,
    String? username,
    String? payment,
  }) =>
      CheckoutForm(
        id: id ?? this.id,
        event: event ?? this.event,
        email: this.email,
        username: username ?? this.username,
        payment: payment ?? this.payment,
      );

  Map<String, dynamic> toJson() {
    return {
      'event': event,
      'email': email,
      'username': username,
      'payment': payment,
    };
  }
}
