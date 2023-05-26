import 'package:event_application/models/transaction_model.dart';

class CheckoutForm {
  String? event;
  String? email;
  String? username;
  String? payment;

  CheckoutForm.fromJson(Map<String, dynamic> json) {
    event = json['event'];
    email = json['email'];
    username = json['username'];

    payment = json['payment'];
  }
  CheckoutForm({
    this.event,
    this.email,
    this.username,
    this.payment,
  });
  CheckoutForm copyWith({
    String? event,
    String? personalDetail,
    String? email,
    String? username,
    String? payment,
  }) =>
      CheckoutForm(
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
