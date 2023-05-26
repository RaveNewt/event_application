part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEmail extends AuthEvent {
  final String email;
  const AuthCheckEmail(this.email);

  @override
  List<Object> get props => [email];
}

class AuthRegister extends AuthEvent {
  final RegisterFormModel data;
  const AuthRegister(this.data);

  @override
  List<Object> get props => [data];
}

class AuthLogin extends AuthEvent {
  final LoginFormModel data;
  const AuthLogin(this.data);

  @override
  List<Object> get props => [data];
}

class AuthGetCurrent extends AuthEvent {}

class AuthLogout extends AuthEvent {}


// class AuthUpdateUser extends AuthEvent {
//   final UserModel user;
//   final UserEditFormModel data;
//   const AuthUpdateUser(this.user, this.data);

//   @override
//   List<Object> get props => [data, user];
// }


