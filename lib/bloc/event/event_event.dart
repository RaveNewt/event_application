part of 'event_bloc.dart';

abstract class EventEvent extends Equatable {
  const EventEvent();

  @override
  List<Object> get props => [];
}

class GetAllEvent extends EventEvent {}

class GetAllCategory extends EventEvent {}

class EventCreate extends EventEvent {
  final EventForm data;
  const EventCreate(this.data);

  @override
  List<Object> get props => [data];
}


// class AuthUpdateUser extends EventEvent {
//   final UserModel user;
//   final UserEditFormModel data;
//   const AuthUpdateUser(this.user, this.data);

//   @override
//   List<Object> get props => [data, user];
// }


