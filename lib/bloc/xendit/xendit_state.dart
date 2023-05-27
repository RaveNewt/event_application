part of 'xendit_bloc.dart';

abstract class XenditState extends Equatable {
  const XenditState();

  @override
  List<Object> get props => [];
}

class XenditInitial extends XenditState {}

class XenditLoading extends XenditState {}

class AuthFailed extends XenditState {
  final String e;
  const AuthFailed(this.e);

  @override
  List<Object> get props => [e];
}

class XenditSuccess extends XenditState {
  final XenditModel data;
  const XenditSuccess(this.data);

  @override
  List<Object> get props => [data];
}
