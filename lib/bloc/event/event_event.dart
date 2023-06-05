part of 'event_bloc.dart';

abstract class EventEvent extends Equatable {
  const EventEvent();

  @override
  List<Object> get props => [];
}

class GetAllEvent extends EventEvent {}

class GetAllCategory extends EventEvent {}

class EventGetCategory extends EventEvent {
  final String category;
  const EventGetCategory(this.category);

  @override
  List<Object> get props => [category];
}

class EventCreate extends EventEvent {
  final EventForm data;
  const EventCreate(this.data);

  @override
  List<Object> get props => [data];
}

class SearchEventName extends EventEvent {
  final String title;
  const SearchEventName(this.title);
  @override
  // TODO: implement props
  List<Object> get props => [title];
}

class EventAdminName extends EventEvent {
  final String user;
  const EventAdminName(this.user);
  @override
  // TODO: implement props
  List<Object> get props => [user];
}

class EventUpdate extends EventEvent {
  final String eventId;
  final EventForm data;
  const EventUpdate(this.eventId, this.data);
  @override
  // TODO: implement props
  List<Object> get props => [eventId, data];
}


// class AuthUpdateUser extends EventEvent {
//   final UserModel user;
//   final UserEditFormModel data;
//   const AuthUpdateUser(this.user, this.data);

//   @override
//   List<Object> get props => [data, user];
// }


