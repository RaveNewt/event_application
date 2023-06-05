part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEmail extends TransactionEvent {
  final String email;
  const AuthCheckEmail(this.email);

  @override
  List<Object> get props => [email];
}

class TrasactionCheckout extends TransactionEvent {
  final CheckoutForm data;
  const TrasactionCheckout(this.data);

  @override
  List<Object> get props => [data];
}

class GetBookingTicketNumber extends TransactionEvent {
  final String tiket;
  const GetBookingTicketNumber(this.tiket);
  @override
  // TODO: implement props
  List<Object> get props => [tiket];
}




// class AuthUpdateUser extends TransactionEvent {
//   final UserModel user;
//   final UserEditFormModel data;
//   const AuthUpdateUser(this.user, this.data);

//   @override
//   List<Object> get props => [data, user];
// }


