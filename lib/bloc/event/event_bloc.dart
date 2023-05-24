import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_application/models/event_form_model.dart';
import 'package:event_application/models/event_model.dart';
import 'package:event_application/models/login_model.dart';
import 'package:event_application/models/register_model.dart';
import 'package:event_application/models/user_model.dart';
import 'package:event_application/services/auth_service.dart';
import 'package:event_application/services/event_service.dart';
import 'package:flutter/material.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc() : super(EventInitial()) {
    on<EventEvent>((event, emit) async {
      if (event is GetAllEvent) {
        try {
          emit(EventLoadingState());

          final events = await EventService().getAllvent();

          emit(EventSuccess(events));
        } catch (e) {
          emit(EventFailed(e.toString()));
        }
      }
      if (event is EventCreate) {
        try {
          emit(EventLoadingState());

          final res = await EventService().createEvent(event.data);

          emit(EventSuccessAdmin(res));
        } catch (e) {
          emit(EventFailed(e.toString()));
        }
      }
      if (event is GetAllCategory) {
        try {
          emit(EventLoadingState());

          final categories = await EventService().getAllCategory();

          emit(CategorySuccess(categories));
        } catch (e) {
          emit(EventFailed(e.toString()));
        }
      }
    });
  }
}
