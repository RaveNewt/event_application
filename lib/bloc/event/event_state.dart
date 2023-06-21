part of 'event_bloc.dart';

abstract class EventState extends Equatable {
  const EventState();

  @override
  List<Object> get props => [];
}

class SearchUninitialized extends EventState {
  @override
  List<Object> get props => [];
}

class EventInitial extends EventState {}

class EventLoadingState extends EventState {}

class EventSuccessDelete extends EventState {}

class EventFailed extends EventState {
  final String e;
  const EventFailed(this.e);

  @override
  List<Object> get props => [e];
}

class EventSuccess extends EventState {
  final List<EventModel> events;
  const EventSuccess(this.events);

  @override
  List<Object> get props => [events];
}

class EventSuccessAdmin extends EventState {
  final EventForm events;
  const EventSuccessAdmin(this.events);

  @override
  List<Object> get props => [events];
}

class PostEvent extends EventState {}

class CategorySuccess extends EventState {
  final List<Category> categories;
  const CategorySuccess(this.categories);

  @override
  List<Object> get props => [categories];
}

class SearchSuccess extends EventState {
  final List<EventData> events;
  const SearchSuccess(this.events);

  @override
  List<Object> get props => [events];
}
