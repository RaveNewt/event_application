part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class AuthFailed extends TransactionState {
  final String e;
  const AuthFailed(this.e);

  @override
  List<Object> get props => [e];
}

class TransactionSuccess extends TransactionState {
  final TransactionModel data;
  const TransactionSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class BookingSuccess extends TransactionState {
  final List<TransactionModel> data;
  const BookingSuccess(this.data);

  @override
  List<Object> get props => [data];
}
